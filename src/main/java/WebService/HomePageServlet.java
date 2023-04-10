package WebService;

import DBOperation.GoodsOperation;
import DBOperation.WarehouseOperation;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import pojo.Goods;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomePageServlet", value = "/HomePage")
public class HomePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsOperation goodsOperation = new GoodsOperation();
        List<Goods> goodsList = goodsOperation.getAllGoods(null);
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        WarehouseOperation warehouseOperation = new WarehouseOperation();
        String[] strings = warehouseOperation.selectAllWarehouseID();
        request.setAttribute("wIDs",gson.toJson(strings));
        request.setAttribute("goodsList",gson.toJson(goodsList));
        request.getRequestDispatcher("/homepage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
