<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.banking.DBConnection" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
    if (userName == null) userName = "Customer";

    String accountNumber = "Not available";
    String accountType = "Not available";
    String balance = "0.00";

    String sql = "SELECT account_number, account_type, balance "
               + "FROM accounts WHERE user_id = ?";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                accountNumber = rs.getString("account_number");
                accountType = rs.getString("account_type");
                balance = rs.getBigDecimal("balance").toPlainString();
            }
        }
    } catch (SQLException e) {
        throw new ServletException("Could not load account details.", e);
    }

    String firstName = userName.trim().split("\\s+")[0];
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Gramin Bank</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --green: #175c3b;
            --green-dark: #10442d;
            --green-light: #e9f4ed;
            --cream: #f7f8f3;
            --text: #203329;
            --muted: #7b8980;
            --border: #e9eee9;
            --white: #ffffff;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
                         Arial, sans-serif;
            background: var(--cream);
            color: var(--text);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* SIDEBAR */
        .sidebar {
            width: 245px;
            background: var(--white);
            border-right: 1px solid var(--border);
            padding: 30px 19px;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 0 9px;
            margin-bottom: 48px;
        }

        .brand-icon {
            width: 45px;
            height: 45px;
            border-radius: 14px;
            display: grid;
            place-items: center;
            background: var(--green);
            color: white;
            font-size: 25px;
        }

        .brand h2 {
            font-size: 20px;
            letter-spacing: -0.6px;
            color: var(--green-dark);
        }

        .brand small {
            color: var(--muted);
            font-size: 11px;
            display: block;
            margin-top: 3px;
        }

        .nav-label {
            padding: 0 12px;
            font-size: 10px;
            font-weight: 800;
            color: #9ba79e;
            letter-spacing: 1.5px;
            margin-bottom: 15px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 13px 14px;
            margin-bottom: 7px;
            border-radius: 11px;
            color: #738077;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .nav-link:hover,
        .nav-link.active {
            background: var(--green-light);
            color: var(--green);
        }

        .nav-icon {
            width: 23px;
            text-align: center;
            font-size: 18px;
        }

        .sidebar-bottom {
            margin-top: auto;
            padding-top: 30px;
        }

        .secure-box {
            background: #f3f7f1;
            padding: 17px;
            border-radius: 13px;
            margin-bottom: 20px;
        }

        .secure-box strong {
            font-size: 13px;
            display: block;
            margin-bottom: 7px;
        }

        .secure-box p {
            font-size: 11px;
            line-height: 1.6;
            color: var(--muted);
        }

        .logout {
            color: #b54747;
        }

        /* MAIN */
        .main {
            flex: 1;
            min-width: 0;
            padding: 30px 4%;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 37px;
        }

        .page-title {
            font-size: 25px;
            font-weight: 750;
            letter-spacing: -0.7px;
        }

        .page-subtitle {
            color: var(--muted);
            font-size: 13px;
            margin-top: 7px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 12px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 10px 15px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 12px;
            background: var(--green-light);
            color: var(--green);
            display: grid;
            place-items: center;
            font-size: 17px;
            font-weight: 800;
        }

        .profile strong {
            font-size: 13px;
            display: block;
        }

        .profile small {
            color: var(--muted);
            font-size: 11px;
            display: block;
            margin-top: 4px;
        }

        .eyebrow {
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.6px;
            text-transform: uppercase;
            color: var(--muted);
            margin-bottom: 15px;
        }

        /* BALANCE CARD */
        .balance-card {
            position: relative;
            overflow: hidden;
            background: linear-gradient(120deg, #175c3b, #103d2b);
            border-radius: 23px;
            color: white;
            padding: 32px 35px;
            margin-bottom: 30px;
            box-shadow: 0 15px 35px #175c3b1c;
        }

        .balance-card::after {
            content: "";
            position: absolute;
            width: 260px;
            height: 260px;
            border: 1px solid #ffffff19;
            border-radius: 50%;
            right: -70px;
            top: -120px;
            box-shadow: 0 0 0 35px #ffffff08,
                        0 0 0 70px #ffffff05;
        }

        .balance-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
            position: relative;
            z-index: 1;
        }

        .balance-label {
            color: #c5ddcd;
            font-size: 13px;
            margin-bottom: 14px;
        }

        .balance-amount {
            font-size: clamp(30px, 4vw, 43px);
            font-weight: 750;
            letter-spacing: -1.2px;
            overflow-wrap: anywhere;
        }

        .balance-caption {
            font-size: 12px;
            color: #c5ddcd;
            margin-top: 12px;
        }

        .account-chip {
            background: #ffffff18;
            border: 1px solid #ffffff24;
            border-radius: 12px;
            padding: 12px 15px;
            font-size: 12px;
            white-space: nowrap;
        }

        .account-chip span {
            display: block;
            font-size: 10px;
            color: #c5ddcd;
            margin-bottom: 5px;
        }

        .balance-bottom {
            position: relative;
            z-index: 1;
            border-top: 1px solid #ffffff26;
            margin-top: 28px;
            padding-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .account-type {
            font-size: 12px;
            color: #dcebe0;
        }

        .status {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            border: 1px solid #ffffff35;
            padding: 8px 12px;
            border-radius: 30px;
            font-size: 11px;
        }

        .status-dot {
            width: 7px;
            height: 7px;
            background: #a8e6ad;
            border-radius: 50%;
        }

        /* QUICK ACTIONS */
        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 17px;
        }

        .section-heading h2 {
            font-size: 18px;
            letter-spacing: -0.4px;
        }

        .section-heading p {
            font-size: 12px;
            color: var(--muted);
        }

        .action-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 16px;
            margin-bottom: 32px;
        }

        .action-card {
            display: block;
            background: white;
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 21px 17px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .action-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px #173e2510;
        }

        .action-icon {
            width: 45px;
            height: 45px;
            display: grid;
            place-items: center;
            background: var(--green-light);
            border-radius: 13px;
            font-size: 21px;
            margin-bottom: 17px;
        }

        .action-card strong {
            display: block;
            font-size: 13px;
            margin-bottom: 7px;
        }

        .action-card p {
            font-size: 11px;
            color: var(--muted);
            line-height: 1.5;
        }

        /* ACCOUNT DETAILS */
        .details-grid {
            display: grid;
            grid-template-columns: 1.3fr 1fr;
            gap: 18px;
        }

        .panel {
            background: white;
            border: 1px solid var(--border);
            border-radius: 17px;
            padding: 24px;
            min-width: 0;
        }

        .panel h2 {
            font-size: 16px;
            margin-bottom: 22px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #eff2ee;
        }

        .detail-row:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .detail-row span {
            font-size: 12px;
            color: var(--muted);
        }

        .detail-row strong {
            font-size: 12px;
            text-align: right;
            overflow-wrap: anywhere;
        }

        .help-panel {
            background: #eef5ed;
            border-radius: 14px;
            padding: 20px;
        }

        .help-icon {
            font-size: 25px;
            margin-bottom: 13px;
        }

        .help-panel h3 {
            font-size: 15px;
            margin-bottom: 9px;
        }

        .help-panel p {
            font-size: 12px;
            line-height: 1.7;
            color: #6e7e72;
            margin-bottom: 16px;
        }

        .help-link {
            display: inline-block;
            color: var(--green);
            font-weight: 750;
            font-size: 12px;
        }

        footer {
            padding: 30px 0 10px;
            text-align: center;
            font-size: 11px;
            color: #94a096;
        }

        @media (max-width: 1000px) {
            .sidebar {
                width: 205px;
            }

            .action-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 700px) {
            .layout {
                display: block;
            }

            .sidebar {
                width: 100%;
                padding: 15px;
                border-right: none;
                border-bottom: 1px solid var(--border);
            }

            .brand {
                margin-bottom: 16px;
            }

            .nav-label,
            .sidebar-bottom {
                display: none;
            }

            .sidebar nav {
                display: flex;
                gap: 7px;
                overflow-x: auto;
            }

            .nav-link {
                white-space: nowrap;
                margin-bottom: 0;
                padding: 10px 12px;
            }

            .main {
                padding: 23px 16px;
            }

            .topbar {
                align-items: flex-start;
                margin-bottom: 25px;
            }

            .page-title {
                font-size: 22px;
            }

            .profile {
                padding: 7px;
            }

            .profile > div:last-child {
                display: none;
            }

            .balance-card {
                padding: 24px 21px;
            }

            .balance-top {
                flex-direction: column;
            }

            .balance-amount {
                font-size: 32px;
            }

            .account-chip {
                white-space: normal;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 380px) {
            .action-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
<div class="layout">

    <aside class="sidebar">
        <a class="brand" href="<%= request.getContextPath() %>/dashboard.jsp">
            <div class="brand-icon">🌾</div>
            <div>
                <h2>Gramin Bank</h2>
                <small>Banking for everyone</small>
            </div>
        </a>

        <div class="nav-label">MAIN MENU</div>

        <nav>
            <a class="nav-link active"
               href="<%= request.getContextPath() %>/dashboard.jsp">
                <span class="nav-icon">▦</span> Dashboard
            </a>

            <a class="nav-link" href="#account-details">
                <span class="nav-icon">▤</span> My Account
            </a>

            <a class="nav-link" href="#quick-actions">
                <span class="nav-icon">⇄</span> Banking Services
            </a>
        </nav>

        <div class="sidebar-bottom">
            <div class="secure-box">
                <strong>🛡 Secure Banking</strong>
                <p>Your account information is available only after you log in.</p>
            </div>

            <a class="nav-link logout"
               href="<%= request.getContextPath() %>/logout">
                <span class="nav-icon">↪</span> Logout
            </a>
        </div>
    </aside>

    <main class="main">

        <header class="topbar">
            <div>
                <h1 class="page-title">Dashboard</h1>
                <p class="page-subtitle">
                    Welcome back, <%= firstName %>! Here's your account overview.
                </p>
            </div>

            <div class="profile">
                <div class="avatar">
                    <%= firstName.substring(0, 1).toUpperCase() %>
                </div>
                <div>
                    <strong><%= userName %></strong>
                    <small>Banking customer</small>
                </div>
            </div>
        </header>

        <div class="eyebrow">YOUR FINANCES AT A GLANCE</div>

        <section class="balance-card">
            <div class="balance-top">
                <div>
                    <p class="balance-label">Total Available Balance</p>
                    <div class="balance-amount">₹ <%= balance %></div>
                    <p class="balance-caption">
                        Your account balance at Gramin Bank
                    </p>
                </div>

                <div class="account-chip">
                    <span>ACCOUNT NUMBER</span>
                    <strong><%= accountNumber %></strong>
                </div>
            </div>

            <div class="balance-bottom">
                <div class="account-type">
                    Account type: <strong><%= accountType %></strong>
                </div>
                <div class="status">
                    <span class="status-dot"></span>
                    Account overview
                </div>
            </div>
        </section>

        <section id="quick-actions">
            <div class="section-heading">
                <h2>Quick Actions</h2>
                <p>Your banking, one step away</p>
            </div>

            <div class="action-grid">
                <a class="action-card" href="#account-details">
                    <div class="action-icon">⇄</div>
                    <strong>Transfer Money</strong>
                    <p>Bank transfers will be available here.</p>
                </a>

                <a class="action-card" href="#account-details">
                    <div class="action-icon">▤</div>
                    <strong>Account Details</strong>
                    <p>Review your account information.</p>
                </a>

                <a class="action-card" href="#services">
                    <div class="action-icon">↗</div>
                    <strong>Deposits</strong>
                    <p>Explore deposit services.</p>
                </a>

                <a class="action-card" href="#services">
                    <div class="action-icon">◷</div>
                    <strong>Transactions</strong>
                    <p>Transaction history can be added next.</p>
                </a>
            </div>
        </section>

        <section class="details-grid" id="account-details">

            <div class="panel">
                <h2>Account Information</h2>

                <div class="detail-row">
                    <span>Account holder</span>
                    <strong><%= userName %></strong>
                </div>

                <div class="detail-row">
                    <span>Account number</span>
                    <strong><%= accountNumber %></strong>
                </div>

                <div class="detail-row">
                    <span>Account type</span>
                    <strong><%= accountType %></strong>
                </div>

                <div class="detail-row">
                    <span>Available balance</span>
                    <strong>₹ <%= balance %></strong>
                </div>
            </div>

            <div class="panel" id="services">
                <h2>Banking Support</h2>

                <div class="help-panel">
                    <div class="help-icon">🌱</div>
                    <h3>Simple. Secure. Reliable.</h3>
                    <p>
                        Welcome to Gramin Bank. Manage your account
                        information from one convenient dashboard.
                        More banking services can be added as the
                        application grows.
                    </p>
                    <a class="help-link"
                       href="<%= request.getContextPath() %>/logout">
                        Sign out securely ↗
                    </a>
                </div>
            </div>

        </section>

        <footer>
            © 2026 Gramin Bank · Banking for everyone
        </footer>

    </main>
</div>
</body>
</html>
