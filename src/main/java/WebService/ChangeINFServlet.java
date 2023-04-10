package WebService;

import DBOperation.WorkerOperation;
import org.apache.commons.codec.digest.DigestUtils;
import pojo.Worker;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static org.apache.commons.codec.CharEncoding.UTF_8;

@WebServlet(name = "ChangeINFServlet", value = "/ChangeINF")
public class ChangeINFServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String accountName = null;
        WorkerOperation workerOperation = new WorkerOperation();
        for (Cookie cookie : cookies){
            if(cookie.getName().equals("workerID")){
                accountName = workerOperation.getAccountName(Integer.valueOf(cookie.getValue()));
            }
        }
        if (accountName == null){
            request.getRequestDispatcher("/index.jsp").forward(request,response);
            return;
        }
        String password = request.getParameter("user_password");
        Worker worker = workerOperation.checkAccount(accountName,DigestUtils.md2Hex(password));
        request.setCharacterEncoding(UTF_8);
        if(worker == null){
            request.setAttribute("changeINF_msg","Wrong password !");
            request.getRequestDispatcher("/Profile").forward(request,response);
        }else {
            worker.setWorkerName(request.getParameter("user_name"));
            worker.setGender(request.getParameter("user_gender"));
            worker.setTel(request.getParameter("user_tel"));
            worker.setEmail(request.getParameter("user_email"));
            worker.setGender(request.getParameter("user_gender"));
            workerOperation.updateWorker(worker);

            request.setAttribute("changeINF_msg","Change Information successfully ! Please re login !");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding(UTF_8);
        this.doGet(request,response);
    }
}
