package com.banking.servlet;

import com.banking.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.SecureRandom;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {


private static final SecureRandom RANDOM = new SecureRandom();

@Override
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String fullName = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String accountType = request.getParameter("accountType");

    if (fullName == null || email == null || password == null
            || fullName.isBlank() || email.isBlank()
            || password.length() < 8) {

        response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                "Enter valid details. Password must be at least 8 characters.");
        return;
    }

    if (accountType == null ||
            !(accountType.equals("SAVINGS")
            || accountType.equals("CURRENT"))) {

        response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                "Please select a valid account type.");
        return;
    }

    String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

    String userSql = "INSERT INTO users (full_name, email, password_hash) VALUES (?, ?, ?)";
    String accountSql = "INSERT INTO accounts (user_id, account_number, account_type) VALUES (?, ?, ?)";

    try (Connection con = DBConnection.getConnection()) {

        con.setAutoCommit(false);

        try {
            int userId;

            try (PreparedStatement ps = con.prepareStatement(
                    userSql, PreparedStatement.RETURN_GENERATED_KEYS)) {

                ps.setString(1, fullName.trim());
                ps.setString(2, email.trim());
                ps.setString(3, passwordHash);
                ps.executeUpdate();

                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (!keys.next()) {
                        throw new SQLException("User ID was not generated.");
                    }
                    userId = keys.getInt(1);
                }
            }

            String accountNumber = generateAccountNumber();

            try (PreparedStatement ps = con.prepareStatement(accountSql)) {
                ps.setInt(1, userId);
                ps.setString(2, accountNumber);
                ps.setString(3, accountType);
                ps.executeUpdate();
            }

            con.commit();

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp?registered=1");

        } catch (SQLException | RuntimeException e) {
            try {
                con.rollback();
            } catch (SQLException rollbackError) {
                e.addSuppressed(rollbackError);
            }
            throw e;
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException ignored) {
                // Connection will close automatically.
            }
        }

    } catch (SQLException e) {
        throw new ServletException(
                "Registration failed: " + e.getMessage(), e);
    }
}

private String generateAccountNumber() {
    StringBuilder number = new StringBuilder("10");

    for (int i = 0; i < 10; i++) {
        number.append(RANDOM.nextInt(10));
    }

    return number.toString();
}


}
