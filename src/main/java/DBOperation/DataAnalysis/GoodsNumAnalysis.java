package DBOperation.DataAnalysis;

import DBOperation.DBMapper.GoodsMapper;
import DBOperation.GoodsOperation;
import DBOperation.SqlSessionFactoryUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.*;

public class GoodsNumAnalysis {
    public int[] numOfGoodsAnalysis(String startTime, String endTime, String colour, Integer warehouseID){
        String[] dateArr = getDateStringArr(startTime,endTime);
        int[] Y = new int[dateArr.length];
        GoodsOperation goodsOperation = new GoodsOperation();
        for (int i=0; i<dateArr.length; i++){
            Y[i] = goodsOperation.countGoodsByColour(dateArr[i],colour,warehouseID);
        }
        return Y;
    }
    public Map<String,Integer> ratioOfDiffGoods(String date, Integer warehouseID){
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("red",goodsMapper.numOfGoodsPerDay(gson.fromJson(date, Date.class),"red",warehouseID));
        map.put("blue",goodsMapper.numOfGoodsPerDay(gson.fromJson(date, Date.class),"blue",warehouseID));
        map.put("yellow",goodsMapper.numOfGoodsPerDay(gson.fromJson(date, Date.class),"yellow",warehouseID));
        map.put("green",goodsMapper.numOfGoodsPerDay(gson.fromJson(date, Date.class),"green",warehouseID));
        sqlSession.close();
        return map;
    }
    public Map<String,Object> numOfGoodsAnalysisPerPos(String startTime, String endTime, String[] positionList, Integer warehouseID){
        int[][] Y = new int[positionList.length][];
        String[] dateList = getDateStringArr(startTime,endTime);
        int[] result = new int[dateList.length];
        GoodsOperation goodsOperation = new GoodsOperation();
        for (int i=0; i<positionList.length; i++){
            for (int j=0; j<dateList.length; j++){
                result[j] = goodsOperation.countGoodsByPosition(dateList[j],positionList[i],warehouseID);
            }
            Y[i] = result.clone();
        }
        Map<String,Object> map = new HashMap<>();
        map.put("Y",Y);
        map.put("dateList",dateList);
        map.put("positionList",positionList);
        return map;
    }
    public String[] getDateStringArr(String startTime, String endTime){
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date start = gson.fromJson(startTime,Date.class);
        Date end = gson.fromJson(endTime,Date.class);
        int dateDiff = getDayCount(start,end);
        String[] dateArr = new String[dateDiff + 1];
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);
        Date nextDate = calendar.getTime();
        for (int i=0; i<=dateDiff; i++){
            dateArr[i] = simpleDateFormat.format(nextDate);
            calendar.add(Calendar.DAY_OF_MONTH,1);
            nextDate = calendar.getTime();
        }
        return dateArr;
    }
    private  int getDayCount(Date date1,Date date2){
        date1 = CalToDate(date1);
        date2 = CalToDate(date2);
        return (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
    }
    private  Date CalToDate(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int mouth = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DATE);
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(year,mouth,day,23,59,59);
        return calendar1.getTime();
    }
}
