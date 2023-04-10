package WebService;

import DBOperation.WarehouseOperation;
import DBOperation.WorkerOperation;
import pojo.Warehouse;
import pojo.Worker;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProfileServlet", value = "/Profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        for (Cookie value : cookies){
            if(value.getName().equals("workerID")){
                cookie = value;
                break;
            }
        }
        if (cookie == null){
            request.getRequestDispatcher("/index.jsp").forward(request,response);
            return;
        }
        Integer workerID = Integer.valueOf(cookie.getValue());
        WorkerOperation workerOperation = new WorkerOperation();
        Worker worker = workerOperation.getWorkerINF(workerID);
        request.setAttribute("accountName", "'"+worker.getAccountName()+"'");
        request.setAttribute("workerName", "'"+worker.getWorkerName()+"'");
        request.setAttribute("gender", "'"+worker.getGender()+"'");
        request.setAttribute("tel", "'"+worker.getTel()+"'");
        request.setAttribute("email", "'"+worker.getEmail()+"'");
        request.setAttribute("salary", "'"+worker.getSalary()+"'");
        WarehouseOperation warehouseOperation = new WarehouseOperation();
        request.setAttribute("workingPlace", "'"+warehouseOperation.getWarehouseName(worker.getWorkingPlace())+"'");
        request.getRequestDispatcher("/profile.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
