# Database Schema for Java Login System (`login_system_schema.sql`)

This file (`login_system_schema.sql`) contains the complete database schema (structure) required for the [Basic Java Login System](README.md) application.

## Purpose of this File

This SQL script is designed to:
* **Recreate the entire database structure:** It includes `CREATE TABLE` statements for all necessary tables (e.g., `users`, `roles`, `sessions`, `blocks`).
* **Define relationships and constraints:** It sets up primary keys, foreign keys, unique constraints, and indexes.
* **Provide a blueprint:** It serves as a blueprint for setting up the MySQL database required by the Java application, ensuring consistency across different environments.

**Important Note:** This file **only contains the database structure (schema)**. It does **NOT** include any data (e.g., user accounts, session records, or block entries). This approach ensures that no sensitive information is exposed in the public repository and allows users to start with a clean database for development or testing.

## How to Use This Schema File

To set up the database for the Java Login System:

1.  **Ensure MySQL Server is Running:** Make sure you have a MySQL server instance accessible on your machine.

2.  **Create the Database:**
    Open your preferred MySQL client (MySQL Workbench, MySQL Shell, phpMyAdmin, etc.) and execute the following SQL command to create the database that the application will connect to:

    ```sql
    CREATE DATABASE IF NOT EXISTS login_system_db;
    USE login_system_db;
    ```
    *The application's `Database.java` class is configured to connect to `login_system_db`. If you choose a different name, remember to update the `DB_URL` constant in `Database.java` accordingly.*

3.  **Import the Schema:**
    Once the database is created, import the structure by executing the `login_system_schema.sql` file.

    **Using MySQL Command Line Client:**
    Navigate to the directory where `login_system_schema.sql` is saved (e.g., your project's root folder) and run:
    ```bash
    mysql -u your_mysql_username -p login_system_db < login_system_schema.sql
    # You will be prompted to enter your MySQL password.
    ```
    **Using MySQL Workbench:**
    * Go to `Server` > `Data Import`.
    * Select "Import from Self-Contained File".
    * Browse and select the `login_system_schema.sql` file.
    * Choose the target schema (`login_system_db`) in the "Target Schema" dropdown.
    * Click "Start Import".

After successful execution, your `login_system_db` will be populated with all the necessary tables, ready for the Java application to interact with.