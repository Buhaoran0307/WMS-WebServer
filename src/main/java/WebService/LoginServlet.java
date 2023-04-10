package WebService;

import DBOperation.WorkerOperation;
import com.google.gson.Gson;
import org.apache.commons.codec.digest.DigestUtils;
import pojo.Worker;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value ="/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String encodePassword;
        encodePassword = DigestUtils.md2Hex(password);
        WorkerOperation workerOperation = new WorkerOperation();
        Worker worker = workerOperation.checkAccount(username,encodePassword);
        Gson gson = new Gson();
        if (worker != null){
            Cookie cookie;
            cookie = new Cookie("workerID",""+worker.getUuid());
            response.addCookie(cookie);
            request.getRequestDispatcher("/HomePage").forward(request,response);
        }else {
            request.setAttribute("login_msg","Account name or password is not correct !");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
