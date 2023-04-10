package WebService;

import DBOperation.DataAnalysis.GoodsNumAnalysis;
import DBOperation.GoodsOperation;
import DBOperation.WarehouseOperation;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

@WebServlet(value = "/Analysis")
public class AnalysisServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String charts = request.getParameter("charts");
        switch (charts){
            case "1":{
                charts1(request, response);
                break;
            }
            case "2":{
                chart2(request,response);
                break;
            }
            case "3":{
                charts3(request, response);
                break;
            }
        }
    }

    private void chart2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsNumAnalysis goodsNumAnalysis = new GoodsNumAnalysis();
        WarehouseOperation warehouseOperation = new WarehouseOperation();
        String[] wIDs = warehouseOperation.selectAllWarehouseID();
        Gson gson = new Gson();

        String tmpWarehouseID = request.getParameter("warehouseID");
        request.getParameterValues()
        String tmpStartTime = request.getParameter("startTime");
        String tmpEndTime = request.getParameter("endTime");
        Integer warehouseID;
        if (tmpWarehouseID == null || tmpWarehouseID.equals("")){
            warehouseID = null;
        }else {
            warehouseID = Integer.valueOf(tmpWarehouseID);
        }
        String startTime;
        if(tmpStartTime == null || tmpStartTime.equals("")){
            startTime = "2022-1-1";
        }else {
            startTime = tmpStartTime;
        }
        String endTime;
        if(tmpEndTime == null || tmpEndTime.equals("")){
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }else {
            endTime = tmpEndTime;
        }

        String[] colourList = new String[4];
        colourList[0] = "red";
        colourList[1] = "blue";
        colourList[2] = "green";
        colourList[3] = "yellow";
        for (String s : colourList){
            int[] result = goodsNumAnalysis.numOfGoodsAnalysis(startTime,endTime,s,warehouseID);
            request.setAttribute(s,gson.toJson(result));
        }
        request.setAttribute("wIDs",gson.toJson(wIDs));
        request.setAttribute("dateList",gson.toJson(goodsNumAnalysis.getDateStringArr(startTime,endTime)));
        request.getRequestDispatcher("/chart2.jsp").forward(request,response);
    }

    private void charts3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String startTime = "2022-1-1";
        String endTime = simpleDateFormat.format(new Date());

        if(request.getParameter("startTime") != null && request.getParameter("endTime") !=null){
            startTime = request.getParameter("startTime");
            endTime = request.getParameter("endTime");
        }
        String[] positionTmpArr = request.getParameterValues("position");

        if (positionTmpArr == null){
            positionTmpArr = new String[2];
            positionTmpArr[0] = "A1-2303";
            positionTmpArr[1] = "A1-3302";
        }

        int length = 0;
        for(String s : positionTmpArr){
            if(!s.equals("")){
                length++;
            }
        }
        String[] positionArr;
        if(length == 0){
            positionArr = new String[1];
            positionArr[0] = "A3-2309";
        }else {
            positionArr = new String[length];
            int j=0;
            for(String s : positionTmpArr){
                if(!s.equals("")){
                    positionArr[j] = s;
                    j++;
                }
            }
        }
        GoodsNumAnalysis goodsNumAnalysis = new GoodsNumAnalysis();
        Map<String,Object> map = goodsNumAnalysis.numOfGoodsAnalysisPerPos(startTime,endTime,positionArr,null);
        int[][] Y = (int[][]) map.get("Y");
        String[] dateList = (String[]) map.get("dateList");
        positionArr = (String[]) map.get("positionList");

        GoodsOperation goodsOperation = new GoodsOperation();
        String totalPos = goodsOperation.selectAllPosition();

        request.setAttribute("totalPos",totalPos);
        request.setAttribute("Y",gson.toJson(Y));
        request.setAttribute("positionNum",positionArr.length);
        request.setAttribute("dateList",gson.toJson(dateList));
        request.setAttribute("positionArr",gson.toJson(positionArr));
        request.getRequestDispatcher("/chart3.jsp").forward(request,response);
    }

    private void charts1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        if (startTime == null || startTime.equals("")){
            startTime = "2022-1-1";
        }
        if (endTime == null || endTime.equals("")){
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }

        Gson gson = new Gson();
        GoodsNumAnalysis goodsNumAnalysis = new GoodsNumAnalysis();
        String[] strings = new String[5];
        strings[0] = "blue";
        strings[1] = "green";
        strings[2] = "yellow";
        strings[3] = "red";
        int[] Y;
        String[] dateLists = goodsNumAnalysis.getDateStringArr(startTime,endTime);
        String s = gson.toJson(dateLists);

        for (int i=0; i<5; i++){
            Y = goodsNumAnalysis.numOfGoodsAnalysis(startTime, endTime, strings[i], null);
            if (strings[i] != null){
                request.setAttribute("data"+strings[i], Arrays.toString(Y));
            }else {
                request.setAttribute("data", Arrays.toString(Y));
            }

        }
        request.setAttribute("dateList", s);
        request.getRequestDispatcher("/chart1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
