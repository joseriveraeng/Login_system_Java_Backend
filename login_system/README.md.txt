# Basic Java Login System

## Project Overview

This project is a fundamental login and user management system developed in Java. It was initiated as a **personal project** and simultaneously served as a key component for my **Object-Oriented Programming (OOP) course in the 4th semester**. The primary goal was to deepen my understanding and practical application of Java concepts within a real-world scenario.

This application provides essential functionalities for user registration, secure login with robust password hashing, and efficient session management. It also incorporates a critical security feature: a blocking mechanism that handles multiple failed login attempts, distinguishing between temporary and permanent account locks. The system seamlessly interacts with a MySQL database for persistent storage and retrieval of all user data, session information, and block records, ensuring data integrity and reliability.

**Key Features Implemented:**
* **User Registration:** Allows new users to securely create accounts.
* **Secure Login:** Authenticates users using BCrypt for strong password hashing and verification.
* **Session Management:** Tracks active user sessions within the application.
* **Account Blocking Logic:**
    * **Temporary Blocks:** Activated after a configurable number of failed login attempts, with an automatic expiration.
    * **Permanent Blocks:** Applied for severe or repeated security breaches.
* **Email Notification for OTP (One-Time Password):** Integrates an email service to send OTPs, enhancing security for features like password recovery or two-factor authentication.
* **Role Management (Basic):** Designed to support basic user roles (e.g., 'user', 'admin') to control access levels within the application.

## Technologies Used

* **Java:** The core programming language, emphasizing OOP principles learned in the course.
* **Apache Maven:** Used for project build automation, dependency management, and managing the project lifecycle.
* **MySQL Database:** The relational database system for persistent data storage.
* **JDBC (Java Database Connectivity):** Standard Java API for connecting to and interacting with the MySQL database.
* **jBCrypt:** A powerful library for secure one-way password hashing.
* **Jakarta Mail (JavaMail API):** Utilized for integrating email functionalities (e.g., sending OTPs).
* **MySQL Connector/J:** The official JDBC driver enabling Java applications to connect with MySQL databases.

## Getting Started

Follow these steps to set up and run the project on your local development environment.

### Prerequisites

Ensure you have the following software installed:

* **Java Development Kit (JDK):** Version 17 or higher is recommended.
    * [Download JDK](https://www.oracle.com/java/technologies/downloads/)
* **Apache Maven:** Version 3.x or higher.
    * [Download Maven](https://maven.apache.org/download.cgi)
* **MySQL Server:** Version 8.x or higher.
    * [Download MySQL Community Server](https://dev.mysql.com/downloads/mysql/)
* **MySQL Workbench (Optional but Recommended):** A visual tool for database administration.
    * [Download MySQL Workbench](https://www.mysql.com/products/workbench/)

### Database Setup

1.  **Create the Database Schema:**
    The application connects to a database named `login_system_db`. Create this database in your MySQL server. You can do this via MySQL Workbench or the command line:

    ```sql
    CREATE DATABASE IF NOT EXISTS login_system_db;
    USE login_system_db;
    ```
    *Refer to the `database_schema.md` file in this repository for more detailed instructions on importing the schema.*

2.  **Import the Database Structure:**
    Execute the `login_system_schema.sql` script (located in the root of this repository) against your `login_system_db`. This script contains all necessary `CREATE TABLE` and `ALTER TABLE` statements to set up the database structure.

    ```bash
    # Example using MySQL command line client:
    mysql -u your_mysql_username -p login_system_db < login_system_schema.sql
    # Enter your MySQL password when prompted.
    ```

3.  **Configure Database Credentials in `Database.java`:**
    * The database connection parameters are defined in `src/main/java/org/example/Database.java`.
    * Update `DB_URL`, `DB_USER`, and `DB_PASSWORD` to match your local MySQL configuration.
    * **Security Note:** For any production deployment, these credentials should be managed via environment variables or a secure configuration mechanism, not hardcoded.

### Email Service Configuration (for OTP/Notifications)

*This section is vital if you plan to use the OTP functionality or any other email-based notifications via `EmailService.java`.*

1.  **Generate a Gmail App Password:**
    The `EmailService` is pre-configured to use Gmail's SMTP server. To enable email sending from your Gmail account:
    * Go to your [Google Account Security settings](https://myaccount.google.com/security).
    * Ensure **2-Step Verification** is enabled for your Google Account.
    * Under "How you sign in to Google," select "App passwords."
    * Follow the prompts to generate a new 16-character password for "Mail" and "Other (Custom Name)". Copy this generated password.

2.  **Update `EmailService.java`:**
    * Open `src/main/java/org/example/EmailService.java`.
    * Replace `SENDER_EMAIL` with your Gmail address (e.g., `eng.jose.rivera@gmail.com`).
    * Replace `SENDER_PASSWORD` with the 16-character App Password you generated (ensure no spaces are included).

### Building and Running the Application

1.  **Clone the Repository (or Download ZIP):**
    ```bash
    git clone [https://github.com/your-github-username/login_system.git](https://github.com/your-github-username/login_system.git) # Replace with your actual repository URL
    cd login_system
    ```
    *(If you downloaded the ZIP, simply extract it and navigate to the `login_system` directory in your terminal.)*

2.  **Compile the Project with Maven:**
    Open your terminal or command prompt in the `login_system` directory (where `pom.xml` is located) and run the Maven build command:
    ```bash
    mvn clean install
    ```
    This command will download dependencies, compile the source code, and package the application into an executable JAR file within the `target/` directory.

3.  **Run the Application:**
    After a successful build, execute the compiled JAR file:
    ```bash
    java -jar target/login-system-1.0-SNAPSHOT.jar # Adjust JAR name if it differs
    ```
    *(The exact JAR filename might vary based on your `pom.xml`'s `<artifactId>` and `<version>`.)*

## Author & Contact

This project was developed by:

* **Name:** Jose Luis Rivera Sosa
* **Email:** eng.jose.rivera@gmail.com
* **Phone:** +52 3327816149