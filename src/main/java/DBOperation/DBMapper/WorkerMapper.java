package DBOperation.DBMapper;

import org.apache.ibatis.annotations.Param;
import pojo.Worker;

public interface WorkerMapper {
    Worker checkWorkerAccount(@Param("username") Object username, @Param("password") String password);
    void addNewWorker(Worker worker);
    Worker isWorker(@Param("accountName") String accountName);
    void updateWorkerINF(Worker worker);
    Worker getWorkerINF(@Param("uuid") Integer uuid);
    String getAccountName(@Param("uuid") Integer uuid);
}
