# Online Banking System

## 📌 About the Project

The Online Banking System is a web-based application developed using Java. It provides a web interface for users to access the banking features implemented in the application.

## 🛠️ Technologies Used

- Java
- Java Servlets
- JSP
- HTML and CSS
- MySQL
- Apache Tomcat
- Maven

## ✨ Features

- User login functionality
- MySQL database connectivity
- Web-based banking interface
- Banking operations implemented in the application

## ⚙️ Prerequisites

Before running this project locally, make sure you have installed:

- Java JDK
- Apache Maven
- Apache Tomcat
- MySQL Server

## 🚀 How to Run the Project

1. Clone or download this repository.
2. Create the required MySQL database and tables.
3. Configure the database connection using the environment variables listed below.
4. Open a terminal in the project directory.
5. Build the project using Maven:

   ```bash
   mvn clean package
   ```

6. Deploy the generated WAR file from the `target` directory to Apache Tomcat.
7. Start the Tomcat server.
8. Open the application in your browser:

   `http://localhost:8080/OnlineBankingSystem/`

## 🗄️ Database Configuration

Configure the following environment variables according to your local MySQL setup:

- `DB_URL` — `jdbc:mysql://localhost:3306/online_banking`
- `DB_USER` — Your local MySQL username
- `DB_PASSWORD` — Your local MySQL password

**Important:** Never upload your actual database password or other sensitive credentials to GitHub. Each user must configure their own database credentials.

## 🌐 Live Demo

**[Click Here to Open Online Banking System Dashboard](https://online-banking-system-48n6.onrender.com/dashboard.jsp)**

## 📂 Project Structure

- `src/` — Application source code
- `pom.xml` — Maven project configuration
- `README.md` — Project documentation
- `target/` — Generated build files

## 📌 Project Status

The application has been deployed online. The live demo is available through the link provided above.

## 🎯 Purpose

This project was developed for learning and practicing Java web development, database connectivity, and server-side application development.