package DBOperation.DBMapper;

import org.apache.ibatis.annotations.Param;
import pojo.Goods;

import java.util.Date;
import java.util.List;

public interface GoodsMapper {
    List<Goods> selectAll(@Param("warehouseID")Integer warehouseID);
    List<Goods> selectAllWithType(@Param("type") String type,@Param("warehouseID")Integer warehouseID);
    Integer numOfGoodsPerDay(@Param("date") Date date, @Param("type") String type, @Param("warehouseID") Integer warehouseID);
    Integer numOfGoodsInPlaceOf(@Param("date")Date date,@Param("location") String location, @Param("warehouseID") Integer warehouseID);
    void insertNewGoods(Goods goods);
    void updateGoodsInf(Goods goods);
    List<Goods> selectByCondition(Goods goods);
    List<String> selectAllPosition();
}
