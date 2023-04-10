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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/Search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String tmpStartTime = request.getParameter("startTime");
        Date startTime;
        String tmpEndTime = request.getParameter("endTime");
        Date endTime;
        String tmpColour = request.getParameter("colour");
        String colour;
        String tmpPosition = request.getParameter("position");
        String position;
        String tmpWID = request.getParameter("wID");
        String wID;

        if (tmpStartTime == null || tmpStartTime.equals("")){
            startTime = null;
        }else {
            try {
                startTime = simpleDateFormat.parse(tmpStartTime);
            } catch (ParseException e) {
                startTime = new Date("2022-1-1");
            }
        }
        if (tmpEndTime == null || tmpEndTime.equals("")){
            endTime = null;
        }else {
            try {
                endTime = simpleDateFormat.parse(tmpEndTime);
            } catch (ParseException e) {
                endTime = new Date();
            }
        }
        if (tmpColour != null && tmpColour.equals("")){
            colour = null;
        }else {
            colour = tmpColour;
        }
        if (tmpPosition != null && tmpPosition.equals("")){
            position = null;
        }else {
            position = tmpPosition;
        }
        if (tmpWID != null && tmpWID.equals("")){
            wID = null;
        }else {
            wID = tmpWID;
        }

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        GoodsOperation goodsOperation = new GoodsOperation();
        List<Goods> goodsList = goodsOperation.selectGoodsByCondition(startTime,endTime,colour,position,wID);
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
