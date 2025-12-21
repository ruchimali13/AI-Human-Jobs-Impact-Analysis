CREATE DATABASE ai_impact_on_jobs_db;

USE ai_impact_on_jobs_db;


-- AI jobs Table

CREATE TABLE ai_jobs (
    ai_job_id INT,
    job_title VARCHAR(100),
    industry VARCHAR(100),
    ai_tool_used VARCHAR(100),
    automation_level VARCHAR(50),
    median_salary_usd INT,
    job_openings_2024 INT,
    projected_openings_2030 INT
);


-- Human jobs Table

CREATE TABLE human_jobs (
    human_job_id INT PRIMARY KEY,
    job_title VARCHAR(100),
    industry VARCHAR(100),
    key_human_skill VARCHAR(100),
    emotional_or_physical_labor ENUM('True','False'),
    median_salary_usd INT,
    job_openings_2024 INT,
    projected_openings_2030 INT
);

select * from human_jobs;
select * from ai_jobs;


-- QUESTIONS

-- 1.Top 5 Highest Paying AI Jobs.
SELECT job_title, median_salary_usd
FROM ai_jobs
ORDER BY median_salary_usd DESC
LIMIT 5;


-- 2.Count Human Jobs by Industry.
SELECT industry, COUNT(*) AS total_human_jobs
FROM human_jobs
GROUP BY industry
ORDER BY total_human_jobs DESC;


-- 3.AI Jobs Grouped by Automation Level.
SELECT automation_level, COUNT(*) AS job_count
FROM ai_jobs
GROUP BY automation_level;


-- 4.Average Salary of Human Jobs Requiring Emotional / Physical Labor.
SELECT emotional_or_physical_labor,AVG(median_salary_usd) AS avg_salary
FROM human_jobs
WHERE emotional_or_physical_labor = 'True';


-- 5.Compare Total Job Openings (AI vs Human).
SELECT 'AI Jobs' AS job_type,
       SUM(job_openings_2024) AS openings_2024,
       SUM(projected_openings_2030) AS openings_2030
FROM ai_jobs
UNION ALL
SELECT 'Human Jobs',
       SUM(job_openings_2024),
       SUM(projected_openings_2030)
FROM human_jobs;


-- 6.Industry-wise Average Salary (AI Jobs).
SELECT industry, AVG(median_salary_usd) AS avg_salary
FROM ai_jobs
GROUP BY industry;


-- 7.Industry-wise Average Salary (Human Jobs).
SELECT industry, AVG(median_salary_usd) AS avg_salary
FROM human_jobs
GROUP BY industry;


-- 8.AI vs Human Average Salary Comparison.
SELECT 'AI Jobs' AS category, AVG(median_salary_usd) AS avg_salary
FROM ai_jobs
UNION ALL
SELECT 'Human Jobs', AVG(median_salary_usd)
FROM human_jobs;

-- 9.obs Growing in Future (2030 > 2024).

-- AI Jobs
SELECT job_title
FROM ai_jobs
WHERE projected_openings_2030 > job_openings_2024;

-- Human Jobs
SELECT job_title
FROM human_jobs
WHERE projected_openings_2030 > job_openings_2024;


-- 10.Top Industries Most Affected by AI (AI Job Count).
SELECT industry, COUNT(*) AS ai_job_count
FROM ai_jobs
GROUP BY industry
ORDER BY ai_job_count DESC;


-- 11.1️⃣ AI and Human Jobs from the Same Industry (INNER JOIN).
SELECT 
    a.job_title AS ai_job,
    h.job_title AS human_job,
    a.industry
FROM ai_jobs a
JOIN human_jobs h
ON a.industry = h.industry;


-- 12.Industries Where Both AI and Human Jobs Exist.
SELECT DISTINCT a.industry
FROM ai_jobs a
JOIN human_jobs h
ON a.industry = h.industry;


-- 13.Compare Average Salary of AI vs Human Jobs (JOIN).
SELECT 
    a.industry,
    AVG(a.median_salary_usd) AS ai_avg_salary,
    AVG(h.median_salary_usd) AS human_avg_salary
FROM ai_jobs a
JOIN human_jobs h
ON a.industry = h.industry
GROUP BY a.industry;


-- 14.Human Job Industries Where No AI Jobs Exist (LEFT JOIN).
SELECT DISTINCT h.industry
FROM human_jobs h
LEFT JOIN ai_jobs a
ON h.industry = a.industry
WHERE a.industry IS NULL;


-- 15.AI Job Industries Where No Human Jobs Exist.
SELECT DISTINCT a.industry
FROM ai_jobs a
LEFT JOIN human_jobs h
ON a.industry = h.industry
WHERE h.industry IS NULL;


-- 16.AI Jobs with Salary Higher Than AI Average.
SELECT job_title, median_salary_usd
FROM ai_jobs
WHERE median_salary_usd >
      (SELECT AVG(median_salary_usd) FROM ai_jobs);


-- 17.Highest Paying AI Job (Subquery).
SELECT job_title, median_salary_usd
FROM ai_jobs
WHERE median_salary_usd =
      (SELECT MAX(median_salary_usd) FROM ai_jobs);
      
      
-- 18.Lowest Paying Human Job.
SELECT job_title, median_salary_usd
FROM human_jobs
WHERE median_salary_usd =
      (SELECT MIN(median_salary_usd) FROM human_jobs);
      
      
-- 19.Industries Where AI Pays More Than Human (Subquery).
SELECT industry
FROM ai_jobs
GROUP BY industry
HAVING AVG(median_salary_usd) >
(
    SELECT AVG(median_salary_usd)
    FROM human_jobs
);


-- 20.CTE: Average Salary of AI Jobs.
WITH ai_avg_salary AS (
    SELECT AVG(median_salary_usd) AS avg_salary
    FROM ai_jobs
)
SELECT *
FROM ai_avg_salary;


-- 21.-- 20.CTE: Average Salary of Human Jobs.
WITH human_avg_salary AS (
    SELECT AVG(median_salary_usd) AS avg_salary
    FROM human_jobs
)
SELECT avg_salary
FROM human_avg_salary;



-- 22.Industry-wise AI Average Salary (CTE).
WITH industry_ai_salary AS (
    SELECT industry, AVG(median_salary_usd) AS avg_salary
    FROM ai_jobs
    GROUP BY industry
)
SELECT *
FROM industry_ai_salary
ORDER BY avg_salary DESC;


-- 23.Industry-wise Human Average Salary (CTE).
WITH industry_human_salary AS (
    SELECT industry, AVG(median_salary_usd) AS avg_salary
    FROM human_jobs
    GROUP BY industry
)
SELECT *
FROM industry_human_salary;


-- 24.Future Growth Jobs (2030 > 2024) Using CTE.

-- AI jobs.
WITH ai_growth AS (
    SELECT job_title
    FROM ai_jobs
    WHERE projected_openings_2030 > job_openings_2024
)
SELECT * FROM ai_growth;

-- Human Jobs.
WITH human_growth AS (
    SELECT job_title
    FROM human_jobs
    WHERE projected_openings_2030 > job_openings_2024
)
SELECT * FROM human_growth;


-- 25.High Automation AI Jobs Using CTE.
WITH high_auto AS (
    SELECT job_title, median_salary_usd
    FROM ai_jobs
    WHERE automation_level = 'High'
)
SELECT *
FROM high_auto
ORDER BY median_salary_usd DESC;


-- 26.Compare total job openings (2024) for AI vs Human.
SELECT 'AI Jobs' AS category, SUM(job_openings_2024) AS total_openings
FROM ai_jobs
UNION ALL
SELECT 'Human Jobs', SUM(job_openings_2024)
FROM human_jobs;


-- 27.Total Job Openings Growth for AI Jobs.
SELECT 
    SUM(projected_openings_2030) - SUM(job_openings_2024) AS total_ai_job_growth
FROM ai_jobs;


-- 28.Highest paying job (AI + Human combined).
SELECT job_title, median_salary_usd
FROM (
    SELECT job_title, median_salary_usd FROM ai_jobs
    UNION ALL
    SELECT job_title, median_salary_usd FROM human_jobs
) AS all_jobs
ORDER BY median_salary_usd DESC
LIMIT 1;












