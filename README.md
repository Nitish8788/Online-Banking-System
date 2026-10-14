# Online Banking System

## About the Project
The Online Banking System is a web-based application developed using Java. It is designed to provide basic banking functionality through a web interface.

## Technologies Used
- Java
- Java Servlets and JSP
- Apache Tomcat
- MySQL
- Maven
- HTML and CSS

## Features
- User login
- Database connectivity
- Web-based user interface
- Banking operations supported by the application

## Prerequisites
- Java JDK
- Apache Maven
- Apache Tomcat
- MySQL Server

## Setup and Installation
1. Clone or download this repository.
2. Create the required MySQL database.
3. Configure the database URL, username, and password using environment variables.
4. Build the project using Maven:
   ```bash
   mvn clean package
   ```
5. Deploy the generated WAR file from the `target` directory to Apache Tomcat.
6. Start Tomcat and open the application in your browser.

## Database Configuration
Set the following environment variables according to your local MySQL configuration:

- `DB_URL`
- `DB_USER`
- `DB_PASSWORD`

Do not upload database passwords or other secrets to GitHub.

## Project Status
The application runs locally. Online deployment is planned.

## Repository
This repository contains the source code and project configuration files.