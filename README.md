# 🤖 AI & Human Jobs Impact Analysis

**Project Name:** ai_impact_on_jobs_db  
**Domain:** SQL | Data Analytics | Workforce Analysis  

---

## 📌 Objective

Analyze the impact of Artificial Intelligence on the job market by comparing **AI-driven roles** and **traditional human jobs** across industries, salaries, automation levels, and projected future growth.

---

## 📊 Project Overview

This project explores the evolving landscape of AI and human-driven jobs using SQL. It provides insights into:

- 💰 Top-paying AI and human jobs  
- 🏭 Industry distribution and overlap  
- 🤖 Automation levels and their impact  
- 📈 Salary comparisons  
- 🔮 Job growth projections up to 2030  

The analysis helps identify lucrative career opportunities, industries affected by AI adoption, and roles where human skills remain critical.

---

## 🗄️ Database Schema

### AI Jobs Table (`ai_jobs`)

| Column                  | Type          | Description                         |
|-------------------------|---------------|-------------------------------------|
| ai_job_id               | INT           | Unique AI job identifier            |
| job_title               | VARCHAR(100)  | Job title                           |
| industry                | VARCHAR(100)  | Industry of the job                 |
| ai_tool_used            | VARCHAR(100)  | AI tool or technology used          |
| automation_level        | VARCHAR(50)   | Low / Medium / High automation      |
| median_salary_usd       | INT           | Median salary in USD                |
| job_openings_2024       | INT           | Current job openings (2024)         |
| projected_openings_2030 | INT           | Projected openings in 2030          |

---

### Human Jobs Table (`human_jobs`)

| Column                     | Type                 | Description                                  |
|----------------------------|----------------------|----------------------------------------------|
| human_job_id               | INT                  | Primary key, unique identifier              |
| job_title                  | VARCHAR(100)         | Job title                                   |
| industry                   | VARCHAR(100)         | Industry of the job                         |
| key_human_skill            | VARCHAR(100)         | Essential human skill                       |
| emotional_or_physical_labor| ENUM('True','False') | Requires emotional or physical labor        |
| median_salary_usd          | INT                  | Median salary in USD                        |
| job_openings_2024          | INT                  | Current job openings (2024)                |
| projected_openings_2030    | INT                  | Projected openings in 2030                 |

---

## 🔍 Key SQL Queries & Insights

### 1️⃣ Top 5 Highest Paying AI Jobs

```sql
SELECT job_title, median_salary_usd
FROM ai_jobs
ORDER BY median_salary_usd DESC
LIMIT 5;
