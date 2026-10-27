Arrowstack Task 1: Multi-Table SQL Queries & Cohort Retention Analysis

1. Project Overview

This project focuses on analyzing customer orders, product revenue, and customer purchasing behaviour using SQL and MySQL Workbench.

The objective is to extract meaningful business insights from relational data using SQL queries.

2. Tools Used

- MySQL
- MySQL Workbench
- SQL
- GitHub

3. Database Tables

The project uses four tables:

- customers: Stores customer details.
- products: Stores product names and prices.
- orders: Stores order details and dates.
- order_items: Stores products and quantities purchased in each order.

4. SQL Queries Performed

Query 1: Product Revenue Analysis

Joined the "order_items" and "products" tables to calculate total revenue for each product.

Business purpose: Identify the products generating the most revenue and support product-level sales decisions.

Execution result: Query executed successfully and returned 4 rows.

Query 2: Customer Order Analysis

Joined the "customers" and "orders" tables to count orders placed by each customer.

Business purpose: Identify frequent customers and understand purchasing behaviour.

Execution result: Query executed successfully and returned 5 rows.

Query 3: Monthly Customer Activity

Grouped orders by month to calculate the number of distinct active customers and total orders.

Business purpose: Monitor monthly customer activity and identify changes in purchasing patterns.

Execution result: Query executed successfully and returned 3 rows.

5. Business Insights

1. Product Performance: The product revenue query provides a revenue ranking for four products. The highest-revenue product can be identified from the query results.

2. Customer Behaviour: The customer order query returned five customers. Their order counts can be compared to identify the most frequent customer.

3. Monthly Activity: The monthly analysis returned three months of results. Comparing active customers and order counts helps identify changes in customer activity.

4. Business Recommendation: The business can use product revenue rankings to prioritize high-performing products and customer order counts to identify potential loyalty-program participants.

5. Further Analysis: Cohort retention analysis is needed to measure how many customers return in subsequent months and to calculate retention percentages.

6. Data Validation

The SQL queries executed successfully. Further validation can include checking for missing values, invalid quantities, duplicate records, and inconsistent dates.

7. Limitations

The current analysis uses a small sample dataset. Findings may not represent actual business performance.

8. Future Improvements

- Complete monthly cohort retention analysis.
- Add more customer and order records.
- Create visualizations using Power BI.
- Develop additional KPIs for sales and customer retention.

9. Conclusion

This project demonstrates the use of SQL JOINs, aggregate functions, GROUP BY, COUNT, SUM, and date-based grouping to analyze product revenue, customer orders, and monthly customer activity.