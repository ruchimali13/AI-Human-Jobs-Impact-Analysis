
# 🤖 AI & HUMAN JOBS IMPACT ANALYSIS 

### Project Name : ai_impact_on_jobs

**Objective** :
Analyze the impact of Artificial Intelligence on the job market by comparing
AI-driven roles and traditional human jobs across industries, salaries,
automation levels, and future growth projections (2024–2030).

## 📂 Project Structure :

ai_impact_on_jobs/
|
|- ai_human_jobs_analysis.sql      | Main SQL analysis file
|
|- database/
|   |- schema.sql                 | CREATE DATABASE & TABLE scripts
|   |- data/
|       |- ai_jobs.csv             | AI jobs table
|       |- human_jobs.csv          | Human jobs table
|
|- screenshots/
|   |-- query_outputs.png          | Sample query results
|
|- README.md


## 🗄️ Database Description :

**Database Name** : ai_impact_on_jobs_db

#### The database contains two tables:

--------------------------------------
1️⃣ AI JOBS TABLE : ai_jobs
--------------------------------------
| Column                  | Type          | Description
|-------------------------|---------------|------------------------------------
| ai_job_id               | INT           | Unique AI job identifier
| job_title               | VARCHAR(100)  | Job title
| industry                | VARCHAR(100)  | Industry of the job
| ai_tool_used            | VARCHAR(100)  | AI tool or technology used
| automation_level        | VARCHAR(50)   | Low / Medium / High automation
| median_salary_usd       | INT           | Median salary in USD
| job_openings_2024       | INT           | Current job openings
| projected_openings_2030 | INT           | Projected openings in 2030

--------------------------------------
2️⃣ HUMAN JOBS TABLE : human_jobs
--------------------------------------
| Column                     | Type                 | Description
|----------------------------|----------------------|-----------------------------------
| human_job_id               | INT                  | Primary key, unique identifier
| job_title                  | VARCHAR(100)         | Job title
| industry                   | VARCHAR(100)         | Industry of the job
| key_human_skill            | VARCHAR(100)         | Essential human skill
| emotional_or_physical_labor| ENUM('True','False') | Requires emotional/physical labor
| median_salary_usd          | INT                  | Median salary in USD
| job_openings_2024          | INT                  | Current job openings
| projected_openings_2030    | INT                  | Projected openings in 2030

## 🛠️ How to set up 

#### 1️⃣ Create Database and Tables

#### Run in MySQL:

- CREATE DATABASE ai_impact_on_jobs_db;
- USE ai_impact_on_jobs_db;

#### Execute table creation scripts from:
- schema.sql

--------------------------------------------------

#### 2️⃣ Insert Job Data

- Import CSV files using MySQL Workbench
                    OR
- Insert records manually using SQL INSERT statements

--------------------------------------------------

#### 3️⃣ Run Analysis Queries

**Execute:**
ai_human_jobs_analysis.sql

**This will generate insights on:**
- Salaries
- Automation levels
- Industry trends
- Future job growth

## 📊 ANALYSIS PERFORMED
### SQL Analysis includes :

### ✔ Salary Analysis
- Top 5 highest-paying AI jobs
- Highest-paying job (AI + Human combined)
- Average salary comparison (AI vs Human)

### ✔ Industry insights
- Human jobs count by industry
- Industries most affected by AI
- Industry overlap between AI and human roles

### ✔ Automation Analysis
- AI jobs grouped by automation level
- High automation roles and salary impact

### ✔ Job Growth Projections
- Jobs growing from 2024 → 2030
- Total job openings growth for AI roles

### ✔ Advanced Sql Techniques
- INNER JOIN & LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Aggregations & UNION queries

## 📈 Sample insights :

- AI roles in technology, finance, and healthcare dominate high salaries
- Human-centric roles remain essential in healthcare, education, construction
- AI job openings are projected to grow faster than human roles
- Hybrid roles combining AI expertise and human judgment are most lucrative
- AI disruption is highest in tech, healthcare, finance, manufacturing

## 🛠️ Tools & Technique used :

- Database       : MySQL
- Query Language : SQL
- Techniques     : Joins, CTEs, Subqueries, Aggregations

## 🧾 Conclusion :

- This project demonstrates how AI is reshaping the workforce while highlighting
the continued importance of human skills.

- It serves as a strong SQL analytics project for students, analysts, and
organizations planning for the future of work.

## ⭐ END OF README

