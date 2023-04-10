package WebService;

import DBOperation.WarehouseOperation;
import DBOperation.WorkerOperation;
import com.google.gson.Gson;
import org.apache.commons.codec.digest.DigestUtils;
import pojo.Worker;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value ="/Register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        switch (type){
            case "init":{
                initINF(request,response);
                break;
            }
            case "INF":{
                dealWithINF(request, response);
                break;
            }
        }
    }

    private void initINF(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WarehouseOperation warehouseOperation = new WarehouseOperation();
        String[] wIDs = warehouseOperation.selectAllWarehouseID();
        Gson gson = new Gson();
        request.setAttribute("wIDs",gson.toJson(wIDs));
        request.getRequestDispatcher("/register.jsp").forward(request,response);
    }

    private void dealWithINF(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountName = request.getParameter("user_account");
        String password = request.getParameter("user_password");
        String encodePassword = DigestUtils.md2Hex(password);
        String workerName = request.getParameter("user_name");
        String gender = request.getParameter("user_gender");
        String tel = request.getParameter("user_tel");
        String email = request.getParameter("user_email");
        int workingPlace = Integer.parseInt(request.getParameter("user_wID"));
        Worker worker = new Worker(accountName,encodePassword,workingPlace);

        if(workerName != null && !workerName.equals("")){
            worker.setWorkerName(workerName);
        }
        if(tel != null && !tel.equals("")){
            worker.setTel(tel);
        }
        if(gender != null && !gender.equals("")){
            worker.setGender(gender);
        }
        if(email != null && !email.equals("")){
            worker.setEmail(email);
        }
        WorkerOperation workerOperation = new WorkerOperation();
        worker = workerOperation.addNewUser(worker);
        if(worker == null){
            request.setAttribute("register_msg","Account name already exists !");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }else{
            workerOperation.updateWorker(worker);
            request.setAttribute("register_msg","Register successful ! Please Log in.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
