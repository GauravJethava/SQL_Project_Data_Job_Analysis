# 📊 SQL Project: SQL_Project_Data_Job_Analysis

## Introduction

This project explores the **2023 Data Job Market** using **SQL** to analyze salary trends, identify in-demand skills, and uncover the qualifications needed for high-paying Data Analyst roles.

The goal of this project is to answer real-world business questions by querying a relational database containing thousands of job postings. Through this analysis, I strengthened my SQL skills while gaining valuable insights into the current data job market.

---

## Background

The demand for Data Analysts continues to grow across industries, making it important to understand which skills employers value and which opportunities offer the best salaries.

Using a dataset of data-related job postings, this project investigates:

- 💰 Highest-paying Data Analyst jobs
- 🛠 Skills required for those jobs
- 📈 Most in-demand skills
- 💵 Highest-paying skills
- 🚀 Skills that provide the best balance of salary and demand

---

## Questions to Answer

This project answers the following business questions:

1. What are the highest-paying Data Analyst jobs?
2. What skills are required for these top-paying jobs?
3. What are the most in-demand skills for Data Analysts?
4. Which skills are associated with the highest salaries?
5. What are the most optimal skills to learn based on demand and salary?

---

## Tools Used

- **PostgreSQL** – Database Management System
- **SQL** – Data querying and analysis
- **Visual Studio Code** – Writing and executing SQL queries
- **Git & GitHub** – Version control and project management

---

## Dataset

The dataset contains thousands of job postings related to Data careers and includes information such as:

- Job Title
- Company
- Salary
- Job Location
- Work Schedule
- Required Skills
- Posting Date

### Database Tables

- `job_postings_fact`
- `company_dim`
- `skills_dim`
- `skills_job_dim`

---

# Analysis

## 1. Top Paying Data Analyst Jobs

### Objective

Identify the highest-paying remote Data Analyst jobs with available salary information.

### SQL Concepts Used

- SELECT
- WHERE
- ORDER BY
- LIMIT
- LEFT JOIN

### Key Insight

Remote Data Analyst positions offer salaries exceeding **$300,000**, with technology companies providing some of the most competitive compensation packages.

---

## 2. Skills Required for Top Paying Jobs

### Objective

Identify which technical skills employers require for the highest-paying Data Analyst positions.

### SQL Concepts Used

- Common Table Expressions (CTEs)
- INNER JOIN
- LEFT JOIN

### Key Insight

High-paying positions consistently require expertise in:

- SQL
- Python
- Tableau
- Power BI
- Cloud Technologies

---

## 3. Most In-Demand Skills

### Objective

Determine which technical skills appear most frequently in Data Analyst job postings.

### SQL Concepts Used

- GROUP BY
- COUNT()
- ORDER BY

### Key Insight

The most requested skills include:

| Rank | Skill |
|------|--------|
| 1 | SQL |
| 2 | Excel |
| 3 | Python |
| 4 | Tableau |
| 5 | Power BI |

---

## 4. Highest Paying Skills

### Objective

Calculate the average salary associated with each technical skill.

### SQL Concepts Used

- AVG()
- ROUND()
- GROUP BY

### Key Insight

Specialized technologies such as **PySpark**, **Snowflake**, cloud platforms, and AI-related tools command significantly higher salaries than traditional analytics tools.

---

## 5. Optimal Skills

### Objective

Identify skills that provide both high demand and high salaries.

### SQL Concepts Used

- Multiple CTEs
- Aggregate Functions
- JOINs
- ORDER BY

### Key Insight

The best skills for career growth include:

- SQL
- Python
- Tableau
- Power BI
- Cloud Technologies

These skills offer an excellent balance between employer demand and earning potential.

---

# SQL Skills Demonstrated

Throughout this project, I applied a variety of SQL concepts, including:

- SELECT Statements
- Filtering with WHERE
- Sorting using ORDER BY
- GROUP BY & HAVING
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Common Table Expressions (CTEs)
- Subqueries
- Aliases
- Data Aggregation
- Business Problem Solving

---

# Key Insights

### 💰 Highest-Paying Jobs

- Remote Data Analyst positions offer excellent earning potential.
- Senior-level and specialized analyst roles receive the highest salaries.

### 🛠 Skills for High Salaries

Employers hiring for high-paying positions consistently look for:

- SQL
- Python
- Tableau
- Power BI
- Cloud Technologies

### 📈 Most In-Demand Skills

SQL remains the most essential skill in the Data Analyst job market, followed by Excel, Python, Tableau, and Power BI.

### 🚀 Career Recommendations

Professionals who develop expertise in SQL, programming, visualization, and cloud technologies will have access to more opportunities and higher salaries.

---

# Conclusion

This project successfully answered five important questions about the Data Analyst job market using SQL analysis.

### 1. What are the highest-paying Data Analyst jobs?

The analysis revealed that remote Data Analyst positions offer some of the highest salaries in the industry, particularly at technology-focused companies.

### 2. What skills are required for the highest-paying jobs?

Top-paying positions commonly require SQL, Python, Tableau, Power BI, and cloud technologies, demonstrating the importance of both technical and analytical skills.

### 3. What are the most in-demand skills?

SQL is the most frequently requested skill, followed by Excel, Python, Tableau, and Power BI. These tools form the core skill set for Data Analysts.

### 4. Which skills have the highest average salaries?

Advanced technologies such as PySpark, Snowflake, cloud platforms, and AI-related tools are associated with higher average salaries.

### 5. What are the most optimal skills to learn?

The best skills are those with both high demand and strong salary potential. SQL, Python, Tableau, Power BI, and cloud technologies provide excellent career opportunities for aspiring Data Analysts.

Overall, this project demonstrates how SQL can transform raw job posting data into meaningful business insights. It also strengthened my understanding of SQL concepts such as joins, aggregations, Common Table Expressions (CTEs), and analytical problem-solving.

---

# Project Structure

```
SQL_Project_Data_Job_Analysis/
│
├── Project_SQL /
│   ├── 1_top_paying_jobs.sql
│   ├── 2_top_paying_job_skills.sql
│   ├── 3_top_demanded_skills.sql
│   ├── 4_top_paying_skills.sql
│   └── 5_optimal_skills.sql
│
└── README.md
```

---

# Future Improvements

- Create an interactive Power BI dashboard
- Optimize SQL queries for performance
- Add Window Functions for advanced analysis
- Build PostgreSQL Views
- Develop additional business insights

---

# About Me

**Gaurav Jethava**

Aspiring Data Analyst passionate about transforming data into actionable insights using SQL, Power BI, Excel, and Python. I enjoy solving business problems through data analysis and continuously improving my technical skills.

### Connect with Me

- GitHub: https://github.com/GauravJethava
- LinkedIn: https://www.linkedin.com/in/gaurav-jethava/

---

⭐ **If you found this project helpful, please consider giving it a Star!**

