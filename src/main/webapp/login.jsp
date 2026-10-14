<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Gramin Bank</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --green: #175c3b;
            --dark: #103d2b;
            --cream: #f7f8f3;
            --muted: #7b8980;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
                         Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            background: var(--cream);
            color: #203329;
        }

        .left-panel {
            width: 48%;
            background: linear-gradient(145deg, #175c3b, #103d2b);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 45px 8%;
            position: relative;
            overflow: hidden;
        }

        .left-panel::before,
        .left-panel::after {
            content: "";
            position: absolute;
            width: 340px;
            height: 340px;
            border: 1px solid #ffffff20;
            border-radius: 50%;
            right: -120px;
            bottom: -90px;
        }

        .left-panel::after {
            width: 250px;
            height: 250px;
            right: -75px;
            bottom: -45px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 13px;
            position: relative;
            z-index: 1;
        }

        .brand-icon {
            width: 49px;
            height: 49px;
            border-radius: 15px;
            display: grid;
            place-items: center;
            background: #ffffff1b;
            font-size: 27px;
        }

        .brand h2 {
            font-size: 23px;
            letter-spacing: -0.5px;
        }

        .brand p {
            color: #c5ddcd;
            font-size: 12px;
            margin-top: 4px;
        }

        .hero {
            position: relative;
            z-index: 1;
            max-width: 470px;
            margin: 50px 0;
        }

        .hero-tag {
            display: inline-block;
            padding: 9px 13px;
            border: 1px solid #ffffff35;
            border-radius: 30px;
            color: #d8eadc;
            font-size: 11px;
            letter-spacing: 1px;
            margin-bottom: 24px;
        }

        .hero h1 {
            font-size: clamp(35px, 4vw, 54px);
            line-height: 1.15;
            letter-spacing: -1.8px;
            margin-bottom: 22px;
        }

        .hero h1 span {
            color: #b8e0bf;
        }

        .hero > p {
            color: #d0e0d4;
            font-size: 15px;
            line-height: 1.9;
            max-width: 390px;
        }

        .features {
            position: relative;
            z-index: 1;
            display: grid;
            gap: 16px;
            margin-top: 35px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            color: #e0ece3;
        }

        .feature-icon {
            width: 36px;
            height: 36px;
            display: grid;
            place-items: center;
            border-radius: 11px;
            background: #ffffff16;
            font-size: 17px;
        }

        .left-footer {
            position: relative;
            z-index: 1;
            color: #b9d2c0;
            font-size: 11px;
        }

        .right-panel {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .login-box {
            width: 100%;
            max-width: 410px;
        }

        .mobile-brand {
            display: none;
        }

        .welcome-label {
            color: var(--green);
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.7px;
            margin-bottom: 15px;
        }

        .login-box h2 {
            font-size: 34px;
            letter-spacing: -1px;
            margin-bottom: 11px;
        }

        .subtitle {
            color: var(--muted);
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 32px;
        }

        .message {
            padding: 13px 15px;
            border-radius: 10px;
            background: #e9f5ec;
            color: #175c3b;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 18px;
        }

        .message.error {
            background: #fff0ef;
            color: #b42318;
        }

        .field {
            margin-bottom: 21px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 9px;
        }

        input {
            width: 100%;
            height: 51px;
            padding: 0 15px;
            border: 1px solid #dce4dc;
            border-radius: 11px;
            font-size: 14px;
            background: white;
            color: #203329;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input::placeholder {
            color: #a2aca4;
        }

        input:focus {
            outline: none;
            border-color: var(--green);
            box-shadow: 0 0 0 3px #175c3b14;
        }

        button {
            width: 100%;
            height: 52px;
            border: none;
            border-radius: 11px;
            background: var(--green);
            color: white;
            font-size: 15px;
            font-weight: 750;
            cursor: pointer;
            margin-top: 5px;
            transition: background 0.2s, transform 0.2s;
        }

        button:hover {
            background: var(--dark);
            transform: translateY(-1px);
        }

        .secure-note {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            color: var(--muted);
            font-size: 11px;
            margin-top: 21px;
        }

        .links {
            text-align: center;
            font-size: 13px;
            color: var(--muted);
            margin-top: 28px;
            line-height: 2.5;
        }

        a {
            color: var(--green);
            font-weight: 750;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .home-link {
            font-size: 12px;
            color: #718076;
        }

        @media (max-width: 850px) {
            .left-panel {
                width: 40%;
                padding: 35px 5%;
            }

            .hero h1 {
                font-size: 36px;
            }

            .right-panel {
                padding: 30px;
            }
        }

        @media (max-width: 650px) {
            body {
                display: block;
            }

            .left-panel {
                display: none;
            }

            .right-panel {
                min-height: 100vh;
                padding: 35px 23px;
            }

            .mobile-brand {
                display: flex;
                align-items: center;
                gap: 11px;
                margin-bottom: 48px;
            }

            .mobile-brand .brand-icon {
                background: var(--green);
                color: white;
            }

            .mobile-brand h3 {
                color: var(--green);
                font-size: 20px;
            }

            .mobile-brand p {
                font-size: 11px;
                color: var(--muted);
                margin-top: 3px;
            }

            .login-box h2 {
                font-size: 30px;
            }

            .subtitle {
                margin-bottom: 27px;
            }
        }
    </style>
</head>

<body>

    <section class="left-panel">

        <a href="index.jsp" class="brand" style="color:white;text-decoration:none">
            <div class="brand-icon">🌾</div>
            <div>
                <h2>Gramin Bank</h2>
                <p>Banking for everyone</p>
            </div>
        </a>

        <div class="hero">
            <div class="hero-tag">YOUR TRUST, OUR RESPONSIBILITY</div>

            <h1>Banking made <span>simple.</span></h1>

            <p>
                Your money, your goals, your future.
                Manage your banking securely with Gramin Bank,
                wherever life takes you.
            </p>

            <div class="features">
                <div class="feature">
                    <div class="feature-icon">🛡</div>
                    <span>Secure account access</span>
                </div>

                <div class="feature">
                    <div class="feature-icon">◷</div>
                    <span>Convenient online banking</span>
                </div>

                <div class="feature">
                    <div class="feature-icon">🌱</div>
                    <span>Built around your needs</span>
                </div>
            </div>
        </div>

        <div class="left-footer">
            © 2026 Gramin Bank. All rights reserved.
        </div>

    </section>

    <main class="right-panel">
        <div class="login-box">

            <a href="index.jsp" class="mobile-brand"
               style="text-decoration:none">
                <div class="brand-icon">🌾</div>
                <div>
                    <h3>Gramin Bank</h3>
                    <p>Banking for everyone</p>
                </div>
            </a>

            <p class="welcome-label">WELCOME BACK</p>

            <h2>Sign in to your account</h2>

            <p class="subtitle">
                Enter your details below to access your banking dashboard.
            </p>

            <% if ("1".equals(request.getParameter("registered"))) { %>
                <p class="message">
                    Account created successfully! Please log in.
                </p>
            <% } %>

            <% if ("1".equals(request.getParameter("error"))) { %>
                <p class="message error">
                    Invalid email or password. Please try again.
                </p>
            <% } %>

            <% if ("1".equals(request.getParameter("logout"))) { %>
                <p class="message">
                    You have logged out successfully.
                </p>
            <% } %>

            <form action="<%= request.getContextPath() %>/login" method="post">

                <div class="field">
                    <label for="email">Email Address</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="you@example.com"
                        autocomplete="email"
                        required
                    >
                </div>

                <div class="field">
                    <label for="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        autocomplete="current-password"
                        required
                    >
                </div>

                <button type="submit">Sign In to Gramin Bank →</button>

            </form>

            <div class="secure-note">
                <span>🔒</span>
                <span>Secure login to your banking account</span>
            </div>

            <div class="links">
                Don't have an account?
                <a href="register.jsp">Create Account</a>

                <br>

                <a class="home-link" href="index.jsp">← Back to Home</a>
            </div>

        </div>
    </main>

</body>
</html>
