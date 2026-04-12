📌 Project Overview
This project presents an end-to-end analysis of a global supply chain dataset containing 180,519 records.
The primary goal was to identify the root causes of shipping delays and quantify their impact on the company's bottom line.

By integrating SQL for deep-data processing and Excel for interactive visualization,
I transformed raw, messy logistics data into actionable business intelligence.

🛠️ Technical Toolkit
Database Management: MySQL Workbench (SQL)

Data Visualization: Microsoft Excel (Advanced Pivot Tables, Slicers, Dynamic Formatting)

Key Skills: * ETL: Optimized high-volume data ingestion using LOAD DATA LOCAL INFILE.

Data Cleaning: Handled character encoding (latin1), date type casting, and schema optimization.

Analytical SQL: Utilized complex aggregations, HAVING clauses, and multi-field calculations.

🚀 The Workflow
1. Data Engineering (SQL)
To handle the scale of 180k+ rows, I bypassed standard import wizards in favor of optimized SQL scripts.

Schema Design: Created a structured relational database in MySQL.

ETL Process: Resolved Error 3948 (local_infile) and Error 1300 (character set) to ensure 100% data integrity during load.

Optimization: Renamed columns to standardized snake_case for better query performance and readability.

2. Strategic Analysis (SQL)
I developed targeted queries to answer three critical business questions:

Market Efficiency: Which global markets are consistently missing shipping deadlines?

Product Bottlenecks: Which specific product categories (e.g., Golf Bags, Soccer equipment) are prone to logistics delays?

Profit Leakage: Does a "Late" delivery status statistically correlate with lower profit margins per order?

3. Executive Dashboard (Excel)
A professional-grade dashboard was created to allow stakeholders to filter data by Market, Category, and Shipping Mode.

KPIs: Highlighted the "Average Delivery Gap" (Real vs. Scheduled days).

UX Design: Cleaned interface by removing gridlines and adding a professional header for a "Software-as-a-Service" (SaaS) aesthetic.

📈 Top 3 Business Insights
Market Variance: The Europe and Pacific Asia markets exhibit the highest shipping delays, averaging a gap of 0.57 days beyond the promised schedule.

Product Risk: High-volume items like Golf Bags and Soccer gear are the most frequent drivers of logistics bottlenecks.

Financial Impact: Analysis confirmed that late deliveries significantly impact the Benefit per order, identifying a clear financial incentive to optimize the "Real Shipping Days" metric.

📂 Repository Contents
Logistics_Analysis.sql: The full SQL script including data cleaning, table alterations, and analytical queries.

Logistics_Dashboard.xlsx: The interactive Excel dashboard file.

Dashboard_Preview.png: A high-resolution screenshot of the final dashboard.

👩‍💻 About the Author
Nivedita | Data Analyst | SQL & Excel Specialist Focusing on bridging the gap between raw data and strategic decision-making.
