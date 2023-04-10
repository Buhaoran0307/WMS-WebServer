package NetworkService;

import DBOperation.DBMapper.LogMapper;
import DBOperation.DBMapper.WarehouseMapper;
import DBOperation.DBMapper.WorkerMapper;
import DBOperation.GoodsOperation;
import DBOperation.SqlSessionFactoryUtil;
import com.google.gson.Gson;
import org.apache.ibatis.session.SqlSession;
import pojo.SQLLog;
import pojo.Worker;

import java.io.*;
import java.net.Socket;
import java.util.*;


public class SocketListener extends Thread{
    private final Socket socket;
    private final int clientNum;
    private final SQLLog sqlLog;
    public SocketListener(Socket socket, int clientNum){
        this.socket = socket;
        this.clientNum = clientNum;
        this.sqlLog = new SQLLog();
        sqlLog.setClientIP(String.valueOf(socket.getRemoteSocketAddress()));
        sqlLog.setTime(new Date());
    }
    public Socket getSocket() {
        return socket;
    }
    @Override
    public void run() {
        try {
            String message;
            System.out.println("Client["+clientNum+"] : Start! ");
            BufferedReader bufferedReader;
            InputStreamReader inputStreamReader;
            inputStreamReader = new InputStreamReader(socket.getInputStream());
            bufferedReader = new BufferedReader(inputStreamReader);
            Iterator<String> iterator;
            while (socket.isConnected()&&!socket.isClosed()){
                iterator = getMessage(bufferedReader);
                message = iterator.next();
                if (message != null){
                    sqlLog.setRequest(message);
                    System.out.println("[Request]: "+message);
                    switch (message){
                        case "GET WarehouseInf" :{
                            sendWarehouseInf();
                            socket.close();
                            break;
                        }
                        case "POST GoodsInf" :{
                            message = iterator.next();
                            sqlLog.setMessage(message);
                            try {
                                GoodsOperation goodsOperation = new GoodsOperation();
                                goodsOperation.addGoods(message);
                                sendResponse(socket,"success");
                                sqlLog.setStatue("success");
                            }catch (Exception e){
                                System.out.println("[WARMING]: Wrong format of goods message!");
                                sendResponse(socket,"failure");
                                sqlLog.setStatue("failure(message in Wrong format)");
                            }
                            socket.close();
                            break;
                        }
                    }
                }
            }
            if(!socket.isClosed()){
                socket.close();
            }
            SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession(true);
            LogMapper logMapper = sqlSession.getMapper(LogMapper.class);
            logMapper.insertLog(sqlLog);
            System.out.println("Client["+clientNum+"] : Stop! ");
        } catch (Exception e) {
            System.out.println("SocketListener: " +e);
        }
    }
    private void sendResponse(Socket socket, String s) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(socket.getOutputStream());
        BufferedWriter bufferedWriter = new BufferedWriter(outputStreamWriter);
        bufferedWriter.write(s);
        bufferedWriter.close();
        outputStreamWriter.close();
        System.out.println("[Response]: "+s);
    }
    private String getMessage(BufferedReader bufferedReader, boolean flag) throws IOException {
        char[] chars = new char[2048];
        int index;
        String message;
        if (bufferedReader.read(chars) == -1){
            return null;
        }else {
            message = new String(chars);
            index = message.indexOf("!**!");
            return  message.substring(0,index);
        }
    }
    private Iterator<String> getMessage(BufferedReader bufferedReader) throws IOException{
        String message = bufferedReader.readLine();
        String[] messageArr = message.split("!\\*\\*!");
        List<String> messageList = Arrays.asList(messageArr);
        return messageList.iterator();
    }
    private void sendWarehouseInf() throws IOException {
        String message;
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession(true);
        WarehouseMapper warehouseMapper = sqlSession.getMapper(WarehouseMapper.class);
        Gson gson = new Gson();
        message = gson.toJson(warehouseMapper.selectAllID());
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(socket.getOutputStream());
        BufferedWriter bufferedWriter = new BufferedWriter(outputStreamWriter);
        bufferedWriter.write(message);
        bufferedWriter.flush();
        System.out.println("Server sends --> "+message);
        sqlLog.setMessage(message);
        sqlLog.setStatue("success");
        socket.shutdownOutput();
        sqlSession.close();
    }
}
