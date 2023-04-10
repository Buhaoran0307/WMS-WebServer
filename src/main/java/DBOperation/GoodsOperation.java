package DBOperation;

import DBOperation.DBMapper.GoodsMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.ibatis.session.SqlSession;
import pojo.Goods;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GoodsOperation {
    public static Goods[] getGoodsFromJson(String json) {
        Gson gson = new Gson();
        Goods[] goodsArr = new Goods[1];
        try{
            if (json.startsWith("[")) {
                goodsArr = gson.fromJson(json, Goods[].class);
            } else {
                Goods goods;
                goods = gson.fromJson(json, Goods.class);
                goodsArr[0] = goods;
            }
        }catch (Exception e){
            System.out.println("Wrong Json format! ");
        }
        return goodsArr;
    }
    public void addGoods(String json){
        Goods[] goodsArr;
        if (json != null){
            System.out.println("New message : ");
            System.out.println(json);
            goodsArr = getGoodsFromJson(json);
            System.out.println(goodsArr.length+" new goods! ");
            for (Goods goods : goodsArr) {
                try {
                    addGoods(goods);
                    System.out.println("Insert --> " + goods);
                } catch (Exception ignored) {
                    System.out.println("[WARMING] : Wrong good info !" + goods.toString());
                }
            }
        }
    }
    public void addGoods(Goods goods){
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession(true);
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        goodsMapper.insertNewGoods(goods);
        sqlSession.commit();
        sqlSession.close();
    }
    public int countGoodsByColour(String date, String colour, Integer warehouseID){
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        int result = goodsMapper.numOfGoodsPerDay(gson.fromJson(date, Date.class),colour,warehouseID);
        sqlSession.close();
        return result;
    }
    public int countGoodsByPosition(String date, String position, Integer warehouseID){
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        int result = goodsMapper.numOfGoodsInPlaceOf(gson.fromJson(date,Date.class),position,warehouseID);
        sqlSession.close();
        return result;
    }
    public List<Goods> getAllGoods(Integer warehouse){
        List<Goods> goodsList;
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        goodsList = goodsMapper.selectAll(warehouse);
        sqlSession.close();;
        return goodsList;
    }
    public String selectAllPosition(){
        Gson gson = new Gson();
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        List<String> result = goodsMapper.selectAllPosition();
        sqlSession.close();
        return gson.toJson(result);
    }
    public List<Goods> selectGoodsByCondition(Date dateIn,Date dateOut,String colour,String position,String wID){
        Goods goods = new Goods();
        goods.setDateIn(dateIn);
        goods.setDateOut(dateOut);
        goods.setColour(colour);
        goods.setLocation(position);
        if(wID != null){
            goods.setWarehouseID(Integer.valueOf(wID));
        }else {
            goods.setWarehouseID(null);
        }
        SqlSession sqlSession = SqlSessionFactoryUtil.sqlSessionFactory.openSession();
        GoodsMapper goodsMapper = sqlSession.getMapper(GoodsMapper.class);
        List<Goods> result = goodsMapper.selectByCondition(goods);
        sqlSession.close();
        return result;
    }
}
