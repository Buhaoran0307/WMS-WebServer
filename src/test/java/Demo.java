import DBOperation.DBMapper.GoodsMapper;
import DBOperation.DataAnalysis.GoodsNumAnalysis;
import DBOperation.SqlSessionFactoryUtil;
import DBOperation.WorkerOperation;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Map;

public class Demo {
    public static void main(String[] args) {

        String url="jdbc:mysql://localhost:3306/WMS";
        String user="root";
        String passwd="123456";
        try {
            Connection connection = DriverManager.getConnection(url,user,passwd);
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE warehouse SET capacity=40 WHERE warehouseID=1");
            statement.close();
            connection.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Test
    public void testDB() throws IOException {
        //--------------------------------------------------------------
        GoodsMapper goodsMapper = SqlSessionFactoryUtil.sqlSessionFactory.openSession().getMapper(GoodsMapper.class);
        //int a = goodsMapper.numOfGoodsPerDay("2021-10-11 00:00:00",null,null);
        //System.out.println(a);
        //--------------------------------------------------------------
    }

    @Test
    public void testMD5(){
        String password = "12345678";
        String encodePassword;
        encodePassword = DigestUtils.md2Hex(password);
        System.out.println(encodePassword);
    }

    @Test
    public void testLogin(){
        WorkerOperation workerOperation = new WorkerOperation();
        System.out.println(workerOperation.checkAccount("test","123456"));
    }
    @Test
    public void ppp(){

    }
}
