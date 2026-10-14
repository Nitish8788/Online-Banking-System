<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Gramin Bank | Banking for Every Village</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        :root {
            --green: #174d35;
            --dark-green: #103b29;
            --light-green: #eaf3e7;
            --cream: #faf8ef;
            --gold: #d7a93b;
            --text: #25392d;
            --muted: #667569;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            background: var(--cream);
            color: var(--text);
            min-height: 100vh;
        }

        nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 8%;
            background: #fffdf7;
            border-bottom: 1px solid #e6e8dc;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--green);
            font-size: 25px;
            font-weight: 800;
            text-decoration: none;
        }

        .logo-mark {
            display: grid;
            place-items: center;
            width: 42px;
            height: 42px;
            border-radius: 50% 50% 50% 8px;
            background: var(--green);
            color: white;
            font-size: 23px;
        }

        nav .links {
            display: flex;
            align-items: center;
            gap: 27px;
        }

        nav a {
            color: #46574a;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        nav a:hover {
            color: #a47715;
        }

        nav .nav-login {
            padding: 12px 20px;
            background: var(--green);
            color: white;
            border-radius: 7px;
        }

        nav .nav-login:hover {
            background: var(--dark-green);
            color: white;
        }

        .hero {
            display: grid;
            grid-template-columns: 1.05fr 0.95fr;
            align-items: center;
            gap: 55px;
            padding: 75px 8% 85px;
            overflow: hidden;
            background:
                radial-gradient(circle at 90% 10%, #e2edcf 0, transparent 35%),
                var(--cream);
        }

        .hero-content {
            max-width: 600px;
        }

        .tag {
            display: inline-block;
            padding: 10px 15px;
            margin-bottom: 24px;
            background: #e6efdf;
            border: 1px solid #d0dfc5;
            border-radius: 30px;
            color: var(--green);
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        h1 {
            color: var(--dark-green);
            font-family: Georgia, serif;
            font-size: clamp(42px, 5vw, 66px);
            line-height: 1.12;
            margin-bottom: 23px;
        }

        h1 span {
            color: #b18423;
        }

        .description {
            color: var(--muted);
            font-size: 16px;
            line-height: 1.9;
            margin-bottom: 30px;
            max-width: 510px;
        }

        .buttons {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 14px;
        }

        .btn {
            display: inline-block;
            padding: 15px 23px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: 0.2s;
        }

        .primary {
            background: var(--green);
            color: white;
        }

        .primary:hover {
            background: var(--dark-green);
            transform: translateY(-2px);
        }

        .secondary {
            color: var(--green);
            border: 1px solid #b7c8b6;
            background: #fffdf7;
        }

        .secondary:hover {
            background: var(--light-green);
        }

        .trust {
            display: flex;
            flex-wrap: wrap;
            gap: 18px;
            margin-top: 30px;
            color: #607163;
            font-size: 12px;
        }

        .trust span::before {
            content: "✓";
            color: #388153;
            font-weight: 800;
            margin-right: 6px;
        }

        .hero-visual {
            position: relative;
            min-height: 410px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
            border-radius: 48% 48% 18px 18px;
            background: linear-gradient(145deg, #dce9c9, #a9c38d);
        }

        .field-art {
            position: absolute;
            inset: 0;
            overflow: hidden;
            border-radius: inherit;
        }

        .sun {
            position: absolute;
            top: 40px;
            right: 55px;
            width: 76px;
            height: 76px;
            border-radius: 50%;
            background: #f5d57b;
        }

        .hill {
            position: absolute;
            bottom: 0;
            width: 120%;
            height: 52%;
            border-radius: 50% 50% 0 0;
        }

        .hill-one {
            left: -15%;
            background: #6c9a60;
            transform: rotate(-8deg);
        }

        .hill-two {
            right: -25%;
            height: 39%;
            background: #39764b;
            transform: rotate(9deg);
        }

        .crop {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 35%;
            opacity: 0.75;
            background: repeating-linear-gradient(
                78deg,
                transparent 0 22px,
                #d4c77e 23px 27px,
                transparent 28px 48px
            );
        }

        .farm-label {
            position: absolute;
            top: 26px;
            left: 24px;
            padding: 10px 14px;
            border-radius: 30px;
            background: #fffdf0e8;
            color: var(--green);
            font-size: 12px;
            font-weight: 700;
        }

        .bank-panel {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 340px;
            margin-top: 125px;
            padding: 25px;
            border: 1px solid #ffffffa6;
            border-radius: 16px;
            background: #fffdf7f2;
            box-shadow: 0 18px 50px #183d2925;
        }

        .panel-title {
            color: var(--muted);
            font-size: 12px;
            margin-bottom: 8px;
        }

        .bank-panel h2 {
            color: var(--green);
            font-family: Georgia, serif;
            font-size: 25px;
            margin-bottom: 7px;
        }

        .panel-description {
            color: var(--muted);
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 19px;
        }

        .panel-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 13px 0;
            border-top: 1px solid #e8e8dc;
            color: var(--text);
            font-size: 13px;
            font-weight: 700;
        }

        .panel-icon {
            display: grid;
            place-items: center;
            width: 37px;
            height: 37px;
            border-radius: 9px;
            background: var(--light-green);
            font-size: 19px;
        }

        .services {
            padding: 70px 8%;
            text-align: center;
            background: #fffdf7;
        }

        .section-tag {
            color: #a47715;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            margin-bottom: 12px;
        }

        .services h2 {
            color: var(--dark-green);
            font-family: Georgia, serif;
            font-size: clamp(29px, 4vw, 39px);
            margin-bottom: 13px;
        }

        .section-description {
            color: var(--muted);
            line-height: 1.8;
            margin: 0 auto 38px;
            max-width: 550px;
            font-size: 14px;
        }

        .service-list {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
            text-align: left;
        }

        .service {
            padding: 29px 25px;
            background: var(--cream);
            border: 1px solid #e8e9dc;
            border-radius: 13px;
            transition: 0.2s;
        }

        .service:hover {
            transform: translateY(-5px);
            border-color: #b7cba8;
            box-shadow: 0 12px 30px #193c2910;
        }

        .service .icon {
            display: grid;
            place-items: center;
            width: 52px;
            height: 52px;
            margin-bottom: 20px;
            border-radius: 12px;
            background: #e5efdc;
            font-size: 25px;
        }

        .service h3 {
            color: var(--green);
            font-size: 18px;
            margin-bottom: 12px;
        }

        .service p {
            color: var(--muted);
            font-size: 13px;
            line-height: 1.8;
        }

        .community {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 25px;
            margin: 0 8% 65px;
            padding: 32px;
            border-radius: 14px;
            background: var(--green);
            color: white;
        }

        .community h2 {
            font-family: Georgia, serif;
            font-size: 25px;
            margin-bottom: 9px;
        }

        .community p {
            color: #d8e6d9;
            font-size: 14px;
            line-height: 1.7;
        }

        .community .btn {
            flex-shrink: 0;
            background: #f0d17e;
            color: #203a26;
        }

        footer {
            padding: 27px 8%;
            background: #103b29;
            color: #d0ded2;
            font-size: 12px;
            line-height: 1.8;
            text-align: center;
        }

        @media (max-width: 900px) {
            nav {
                padding: 18px 5%;
            }

            nav .links {
                gap: 15px;
            }

            .hero {
                padding: 55px 6%;
                gap: 30px;
            }

            .hero-visual {
                min-height: 360px;
            }

            .service-list {
                gap: 13px;
            }

            .service {
                padding: 22px 17px;
            }
        }

        @media (max-width: 650px) {
            nav {
                align-items: flex-start;
                gap: 17px;
                flex-direction: column;
            }

            nav .links {
                width: 100%;
                flex-wrap: wrap;
                gap: 16px;
            }

            nav a {
                font-size: 13px;
            }

            .hero {
                grid-template-columns: 1fr;
                padding: 48px 6%;
            }

            h1 {
                font-size: 44px;
            }

            .hero-visual {
                min-height: 350px;
            }

            .services {
                padding: 55px 6%;
            }

            .service-list {
                grid-template-columns: 1fr;
            }

            .service {
                padding: 25px;
            }

            .community {
                align-items: flex-start;
                flex-direction: column;
                margin: 0 6% 45px;
                padding: 25px;
            }
        }
    </style>
</head>

<body>

    <nav>
        <a class="logo" href="#home">
            <span class="logo-mark">🌾</span>
            <span>Gramin Bank</span>
        </a>

        <div class="links">
            <a href="#home">Home</a>
            <a href="#services">Our Services</a>
            <a href="#farmers">For Farmers</a>
            <a href="login.jsp" class="nav-login">Customer Login</a>
        </div>
    </nav>

    <main>
        <section class="hero" id="home">

            <div class="hero-content">
                <div class="tag">🌱 BANKING ROOTED IN YOUR COMMUNITY</div>

                <h1>Banking that <span>grows with you.</span></h1>

                <p class="description">
                    From your first savings to your family's future,
                    Gramin Bank brings simple banking closer to home.
                    Manage your money with confidence, wherever life takes you.
                </p>

                <div class="buttons">
                    <a href="register.jsp" class="btn primary">
                        Open an Account →
                    </a>

                    <a href="login.jsp" class="btn secondary">
                        Customer Login
                    </a>
                </div>

                <div class="trust">
                    <span>Simple Banking</span>
                    <span>Community First</span>
                    <span>Secure Access</span>
                </div>
            </div>

            <div class="hero-visual">
                <div class="field-art">
                    <div class="sun"></div>
                    <div class="hill hill-one"></div>
                    <div class="hill hill-two"></div>
                    <div class="crop"></div>
                </div>

                <div class="farm-label">🌾 Saath gaon ka, vikas sabka</div>

                <div class="bank-panel">
                    <div class="panel-title">WELCOME TO GRAMIN BANK</div>
                    <h2>Your goals matter.</h2>
                    <p class="panel-description">
                        Everyday banking designed around people,
                        families and rural communities.
                    </p>

                    <div class="panel-item">
                        <span class="panel-icon">🏦</span>
                        <span>Savings & Deposits</span>
                    </div>

                    <div class="panel-item">
                        <span class="panel-icon">🌾</span>
                        <span>Kisan Banking</span>
                    </div>

                    <div class="panel-item">
                        <span class="panel-icon">↗</span>
                        <span>Easy Money Transfers</span>
                    </div>
                </div>
            </div>

        </section>

        <section class="services" id="services">
            <div class="section-tag">BANKING FOR EVERYONE</div>

            <h2>Har ghar, har kisan ke saath.</h2>

            <p class="section-description">
                Banking solutions for everyday needs, helping you
                save, manage and move your money with ease.
            </p>

            <div class="service-list">

                <article class="service">
                    <div class="icon">🏦</div>
                    <h3>Savings & Deposits</h3>
                    <p>
                        Keep your savings organised and manage your
                        account through a simple banking experience.
                    </p>
                </article>

                <article class="service" id="farmers">
                    <div class="icon">🌾</div>
                    <h3>Kisan Banking</h3>
                    <p>
                        A dedicated place for farmers to explore
                        banking services and manage their finances.
                    </p>
                </article>

                <article class="service">
                    <div class="icon">💸</div>
                    <h3>Money Transfers</h3>
                    <p>
                        Access transfer services and keep track of
                        your banking transactions in one place.
                    </p>
                </article>

            </div>
        </section>

        <section class="community">
            <div>
                <h2>Your village. Your bank. Your future.</h2>
                <p>
                    Take the next step towards simpler everyday banking.
                </p>
            </div>

            <a href="register.jsp" class="btn">Get Started →</a>
        </section>
    </main>

    <footer>
        © 2026 Gramin Bank · Online Banking System · Academic Project
        <br>
        Demo website for educational purposes.
    </footer>

</body>
</html>

