# F.W. Webb SQL Project

This project demonstrates the creation, population, and querying of a sample SQLite database. It includes scripts for setting up the database schema, inserting data, and executing queries to solve specific database-related problems.


## How to Set Up and Run the Project

### Prerequisites

1. **SQLite**: Download and install [SQLite](https://www.sqlite.org/download.html).
2. **SQLite CLI or GUI**: Optionally, you can use a database management tool.
3. **Clone or Download the Project**: Download this project repository to your local machine.

### Step 1: Create the Database

Navigate to the `database` folder in your terminal and open SQLite:

```bash
cd webb_proj/database
sqlite3 exercise_database.db
```
### Step 2: Create Tables
Run the schema.sql script to create all required tables:

```sql
.read schema.sql
```


### Step 3: Populate the Database
Run the data.sql script to insert sample data into the tables:

```sql
.read data.sql
```

### Step 4: Run Queries
Run the queries.sql script to execute the queries for the exercise questions:
```sql
.read queries.sql
```

## Note on Re-running Scripts

If you re-run the scripts (`schema.sql`, `data.sql`), here’s what you need to know:
1. **`schema.sql`**: To avoid errors, the script includes `DROP TABLE IF EXISTS` statements to reset the database structure.
2. **`data.sql`**: To prevent duplicate rows, the script clears existing data or uses `INSERT OR IGNORE`.
3. **`queries.sql`**: Safe to re-run as it only executes `SELECT` queries and does not modify the database.

Always ensure the scripts are executed in the correct order: `schema.sql` → `data.sql` → `queries.sql`.


### Exercise Queries Explained
- Question 1: Retrieve order details for "Jack's Plumbing," including order date, item description, sales, gross profit, and gross profit percentage.
- Question 2: Calculate total sales, gross profit, and gross profit percentage for each item category.
- Question 3: List all orders that do not have a corresponding customer.
- Question 4: Find the largest sales transaction for each customer.
- Question 5: List the top 3 sales transactions for each customer.
- Question 6: Calculate total sales and minimum gross profit percentage for customers in branch 3.

The solutions for these queries are provided in queries.sql with detailed comments explaining each step.

### Testing the Queries

1. Run Queries Individually:
    - Run Queries Individually:
    
    ```bash
    sqlite3 exercise_database.db
    ```
2. Load the queries.sql file in SQLite::
    - Load the queries.sql file to execute all queries in sequence:
    
    ```bash
    sqlite3 exercise_database.db
    ```

### Troubleshooting
- No Results in Queries: Check if the data in the tables matches the expected format.
- Syntax Errors: Ensure all SQL scripts are executed in order (schema.sql → data.sql → queries.sql).
- SQLite Not Installed: Download SQLite from here.