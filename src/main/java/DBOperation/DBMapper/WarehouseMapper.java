package DBOperation.DBMapper;

import org.apache.ibatis.annotations.Param;

public interface WarehouseMapper {
    String[] selectAllID();
    String[] selectAllName();
    String selectNameByID(@Param("warehouseID") Integer warehouseID);
}
