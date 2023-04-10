package DBOperation;

import DBOperation.DBMapper.WarehouseMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class WarehouseOperation {
    public String getWarehouseName(Integer warehouseID){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WarehouseMapper warehouseMapper = sqlSession.getMapper(WarehouseMapper.class);
        String result = warehouseMapper.selectNameByID(warehouseID);
        sqlSession.close();
        return result;
    }
    public String[] selectAllWarehouseID(){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WarehouseMapper warehouseMapper = sqlSession.getMapper(WarehouseMapper.class);
        String[] wIDs = warehouseMapper.selectAllID();
        sqlSession.close();
        return wIDs;
    }
}
