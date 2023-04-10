package NetworkService;

import org.apache.ibatis.session.SqlSessionFactory;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class DataServerThread extends Thread{
    public static final int PORT = 1106;
    public static int clientNum = 0;
    public static ArrayList<SocketListener> socketListenerList = new ArrayList<>();
    private static boolean alive = true;
    public SqlSessionFactory sqlSessionFactory;

    public DataServerThread(){}

    public static void setAlive(boolean alive) {
        DataServerThread.alive = alive;
    }

    @Override
    public void run() {
        Socket socket;
        ServerSocket serverSocket;
        SocketListener socketListener;
        try{
            serverSocket = new ServerSocket(PORT);
            System.out.println("DataServerThread: start!");
            while (alive){
                socket = serverSocket.accept();
                socketListener = new SocketListener(socket,++clientNum);
                socketListener.run();
                socketListenerList.removeIf(tmpSocketListener -> tmpSocketListener.getSocket().isClosed());
                socketListenerList.add(socketListener);
            }
            System.out.println("DataServerThread: Stop!");
        }catch(Exception e) {
            System.out.println("DataServerThread: "+e);
        }
    }
}
