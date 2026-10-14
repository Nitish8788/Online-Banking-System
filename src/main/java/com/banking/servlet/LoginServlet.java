
package com.banking.servlet;

import com.banking.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT user_id, full_name, password_hash "
                   + "FROM users WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email == null ? "" : email.trim());

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next() && password != null
                        && BCrypt.checkpw(password,
                                rs.getString("password_hash"))) {

                    HttpSession session = request.getSession();
                    session.setAttribute("userId", rs.getInt("user_id"));
                    session.setAttribute("userName", rs.getString("full_name"));

                    response.sendRedirect(
                            request.getContextPath() + "/dashboard.jsp");

                } else {
                    response.sendRedirect(
                            request.getContextPath() + "/login.jsp?error=1");
                }
            }

        } catch (Exception e) {
            throw new ServletException("Login failed.", e);
        }
    }
}