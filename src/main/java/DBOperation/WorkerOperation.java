package DBOperation;

import DBOperation.DBMapper.WorkerMapper;
import com.sun.corba.se.spi.orbutil.threadpool.Work;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import pojo.Worker;

public class WorkerOperation {
    public Worker checkAccount(String userName,String password){
        WorkerMapper workerMapper = SqlSessionFactoryUtil.sqlSessionFactory.openSession().getMapper(WorkerMapper.class);
        return workerMapper.checkWorkerAccount(userName,password);
    }
    public Worker addNewUser(Worker worker){
        if(isWorker(worker.getAccountName())){
            return null;
        }
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WorkerMapper workerMapper = sqlSession.getMapper(WorkerMapper.class);
        workerMapper.addNewWorker(worker);
        sqlSession.commit();
        sqlSession.close();
        return worker;
    }
    public void updateWorker(Worker worker){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WorkerMapper workerMapper = sqlSession.getMapper(WorkerMapper.class);
        workerMapper.updateWorkerINF(worker);
        sqlSession.commit();
        sqlSession.close();
    }
    public boolean isWorker(String accountName){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WorkerMapper workerMapper = sqlSession.getMapper(WorkerMapper.class);
        Worker worker = workerMapper.isWorker(accountName);
        sqlSession.close();
        return !(worker == null);
    }
    public Worker getWorkerINF(Integer workerID){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WorkerMapper workerMapper = sqlSession.getMapper(WorkerMapper.class);
        Worker worker = workerMapper.getWorkerINF(workerID);
        sqlSession.close();
        return worker;
    }
    public String getAccountName(Integer uuid){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        WorkerMapper workerMapper = sqlSession.getMapper(WorkerMapper.class);
        String result = workerMapper.getAccountName(uuid);
        sqlSession.close();
        return result;
    }
}
