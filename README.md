# AI-Human-Jobs-Impact-Analysis

## Project: ai_impact_on_jobs_db
-**Objective**-: Analyze the impact of AI on the job market by comparing AI-driven roles and traditional human jobs across industries, salaries, automation levels, and projected future growth. 

### Project Overview
#### This project explores the evolving landscape of AI and human-driven jobs using SQL. It provides insights into:
- Top-paying AI and human jobs
- Industry distribution and overlap
- Automation levels and their impact
- Salary comparisons
- Future job growth projections (up to 2030)
#### The analysis helps identify lucrative opportunities, industries affected by AI, and roles where human skills remain critical.

## Database Schema

### AI Jobs Table (`ai_jobs`)

| Column                  | Type          | Description                         |
|-------------------------|---------------|-------------------------------------|
| ai_job_id               | INT           | Unique AI job identifier            |
| job_title               | VARCHAR(100)  | Job title                           |
| industry                | VARCHAR(100)  | Industry of the job                 |
| ai_tool_used            | VARCHAR(100)  | AI tool or technology used          |
| automation_level        | VARCHAR(50)   | Low/Medium/High automation          |
| median_salary_usd       | INT           | Median salary in USD                |
| job_openings_2024       | INT           | Current job openings                |
| projected_openings_2030 | INT           | Projected openings in 2030          |

## Human Jobs Table (`human_jobs`)

| Column                     | Type                     | Description                                  |
|----------------------------|--------------------------|----------------------------------------------|
| human_job_id               | INT                      | Primary key, unique identifier              |
| job_title                  | VARCHAR(100)             | Job title                                   |
| industry                   | VARCHAR(100)             | Industry of the job                         |
| key_human_skill            | VARCHAR(100)             | Essential human skill                       |
| emotional_or_physical_labor| ENUM('True','False')     | Requires emotional/physical labor          |
| median_salary_usd          | INT                      | Median salary in USD                        |
| job_openings_2024          | INT                      | Current job openings                        |
| projected_openings_2030    | INT                      | Projected openings in 2030                  |

## Key SQL Queries & Insights
1. Top 5 Highest Paying AI Jobs
'''sql
SELECT job_title, median_salary_usd
FROM ai_jobs
ORDER BY median_salary_usd DESC
LIMIT 5;
#### Insight: AI roles in tech, finance, and healthcare dominate the high-paying jobs.

3. Count Human Jobs by Industry
'''sql
SELECT industry, COUNT(*) AS total_human_jobs
FROM human_jobs
GROUP BY industry
ORDER BY total_human_jobs DESC;
Insight: Healthcare, education, and construction rely heavily on human labor.
5. AI Jobs by Automation Level
SELECT automation_level, COUNT(*) AS job_count
FROM ai_jobs
GROUP BY automation_level;
Insight: High automation roles are concentrated in tech-heavy industries.
6. Average Salary for Human Jobs Requiring Emotional/Physical Labor
SELECT AVG(median_salary_usd) AS avg_salary
FROM human_jobs
WHERE emotional_or_physical_labor = 'True';
Insight: These roles typically have lower salaries than specialized AI roles.
7. Compare Total Job Openings (AI vs Human)
SELECT 'AI Jobs' AS job_type,
       SUM(job_openings_2024),
       SUM(projected_openings_2030)
FROM ai_jobs
UNION ALL
SELECT 'Human Jobs',
       SUM(job_openings_2024),
       SUM(projected_openings_2030)
FROM human_jobs;
Insight: AI job openings are projected to grow faster than human roles.
8. Highest Paying Job (AI + Human Combined)
SELECT job_title, median_salary_usd
FROM (
    SELECT job_title, median_salary_usd FROM ai_jobs
    UNION ALL
    SELECT job_title, median_salary_usd FROM human_jobs
) AS all_jobs
ORDER BY median_salary_usd DESC
LIMIT 1;
Insight: Hybrid roles that combine AI expertise and human judgment are the most lucrative.
Additional Analyses
Industry-wise Salary Comparison: AI vs Human salaries across sectors.
Future Job Growth: Roles expected to grow between 2024–2030.
High Automation AI Jobs: Top-paying AI roles requiring minimal human intervention.
Industry Overlaps: Industries with both AI and human roles vs those with only one type.
Key Findings
AI Skills Premium: AI jobs consistently offer higher salaries.
Human-Centric Jobs Remain Critical: Roles requiring emotional or physical labor remain essential.
Future Growth: AI job openings expected to surge in technology, finance, and manufacturing.
High-Paying Hybrid Roles: Jobs combining AI tools and human judgment command top salaries.
Industry Disruption: AI adoption impacts technology, healthcare, finance, and manufacturing most.
Technologies Used
Database: MySQL
Analysis: SQL queries including joins, subqueries, aggregations, and CTEs
How to Use
Clone the repository:
git clone <repository_url>
Create the database and tables in MySQL:
CREATE DATABASE ai_impact_on_jobs_db;
USE ai_impact_on_jobs_db;
-- Execute table creation scripts
Populate the tables with AI and human job data.
Run SQL queries to analyze trends, salaries, and job growth.
Conclusion
This project highlights the impact of AI on the labor market and identifies opportunities for professionals to focus on high-paying AI, hybrid, or human-centric roles. Organizations can leverage these insights to plan workforce strategies in the era of AI.
Future Enhancements
Integrate visualizations (charts for salaries, growth, automation)
Add real-world datasets from LinkedIn, Glassdoor, or Bureau of Labor Statistics
Build a dashboard for interactive AI vs human job insights
If you want, I can create a version with badges, tables, and example charts embedded so it looks like a complete professional GitHub project ready for public release.
Do you want me to do that next?
