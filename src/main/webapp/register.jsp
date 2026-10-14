<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Gramin Bank</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f4f5e9;
            color: #24382b;
            padding: 20px;
        }

        .register-box {
            width: 100%;
            max-width: 440px;
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 12px 40px #183c2518;
        }

        .logo {
            text-align: center;
            font-size: 27px;
            font-weight: bold;
            color: #245b38;
        }

        h1 {
            text-align: center;
            font-size: 25px;
            margin: 16px 0 8px;
        }

        .subtitle {
            text-align: center;
            color: #69766c;
            font-size: 14px;
            margin-bottom: 22px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin: 14px 0 7px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #d5ddd5;
            border-radius: 8px;
            font-size: 15px;
            background: white;
        }

        input:focus, select:focus {
            outline: 2px solid #9ac5a1;
            border-color: #357348;
        }

        button {
            width: 100%;
            margin-top: 23px;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #245b38;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #19452a;
        }

        .links {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            line-height: 2;
        }

        a {
            color: #245b38;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <main class="register-box">
        <div class="logo">🌾 Gramin Bank</div>
        <h1>Create Your Account</h1>
        <p class="subtitle">Join us for simple and secure banking</p>

        <form action="register" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Enter your full name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Create a password" minlength="8" required>

            <label for="accountType">Account Type</label>
            <select id="accountType" name="accountType" required>
                <option value="">Select account type</option>
                <option value="SAVINGS">Savings Account</option>
                <option value="CURRENT">Current Account</option>
            </select>

            <button type="submit">Create Account</button>
        </form>

        <div class="links">
            Already registered?
            <a href="login.jsp">Login here</a>
            <br>
            <a href="index.jsp">← Back to Home</a>
        </div>
    </main>
</body>
</html>

