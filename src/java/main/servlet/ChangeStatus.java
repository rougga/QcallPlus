package main.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.CfgHandler;
import org.apache.commons.lang3.StringUtils;

public class ChangeStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String status = request.getParameter("status");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String windowText = request.getParameter("windowText");
            String branchId = request.getParameter("branchId");
            String window = request.getParameter("window");
            String host = request.getParameter("host");
            String port = request.getParameter("port");
            if (StringUtils.isNotBlank(status)) {
                request.getSession().setAttribute("status", status);
            }
            if (StringUtils.isNotBlank(username)) {
                request.getSession().setAttribute("userName", username);
            }
            if (StringUtils.isNotBlank(windowText)) {
                request.getSession().setAttribute("SEAT_WINSTR", windowText);
            }
            if (StringUtils.isNotBlank(username)) {
                request.getSession().setAttribute("userId", username);
            }
            if (StringUtils.isNotBlank(branchId)) {
                request.getSession().setAttribute("branchId", branchId);
            }
            if (StringUtils.isNotBlank(window)) {
                request.getSession().setAttribute("windowId", window);
            }
            if (StringUtils.isNotBlank(password)) {
                request.getSession().setAttribute("pp", password);
            }
            if (StringUtils.isNotBlank(host)) {
                request.getSession().setAttribute("host", host);
            }
            if (StringUtils.isNotBlank(port)) {
                request.getSession().setAttribute("port", port);
            }
            request.getSession().setAttribute("auto_call", CfgHandler.AUTO_CALL_STATUS);
            request.getSession().setAttribute("auto_deal", CfgHandler.AUTO_DEAL_STATUS);
            request.getSession().setAttribute("auto_call_time", CfgHandler.AUTO_CALL_TIME);
            request.getSession().setAttribute("call_wait_time", CfgHandler.AUTO_WAIT_TIME);

            System.err.println("QCall.ChangeStatus.status = " + status);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
