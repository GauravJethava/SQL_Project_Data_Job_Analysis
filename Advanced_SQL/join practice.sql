/* =====================================================
Problem 1: Jobs and Skills

Fetch:

* Job Title
* Job Location
* Skill Name

Only for jobs located in 'New York'
===================================================== */

SELECT
j.job_title AS Job_Title,
j.job_location AS Job_Location,
skill.skills AS Skill_Name
FROM job_postings_fact j
INNER JOIN skills_job_dim s ON j.job_id=s.job_id
INNER JOIN skills_dim skill ON s.skill_id=skill.skill_id
WHERE j.job_location='New York'
ORDER BY Job_Title;

/* =====================================================
Problem 2: Jobs Without Skills

Show:
- Job Title
- Skill Name

Include all jobs even if no skills are listed
===================================================== */

SELECT
    j.job_title AS Job_Title,
    skill.skills AS Skill_Name
FROM job_postings_fact j
LEFT JOIN skills_job_dim s
    ON j.job_id = s.job_id
LEFT JOIN skills_dim skill
    ON s.skill_id = skill.skill_id;

/* =====================================================
Problem 3: Count Skills Per Job

Find:

* Job Title
* Number of Skills Required
  ===================================================== */

SELECT
j.job_id,
j.job_title_short AS Job_Title,
count(skill.skills) AS Skills_Required
FROM job_postings_fact j
LEFT JOIN skills_job_dim s ON j.job_id=s.job_id
LEFT JOIN skills_dim skill ON s.skill_id=skill.skill_id
GROUP BY j.job_id,j.job_title_short;

/* =====================================================
Problem 4: Top 10 Most Demanded Skills

Find the top 10 most demanded skills
===================================================== */

SELECT
skill.skills AS skill_name,
COUNT(*) AS demand_count
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
GROUP BY skill.skills
ORDER BY demand_count DESC
LIMIT 10;

/* =====================================================
Problem 5: Company, Job and Skill

Show:

* Company Name
* Job Title
* Skill Name

Only jobs:

* Offering Health Insurance
* Located in New York
  ===================================================== */

SELECT
c.name AS Company_Name,
j.job_title_short AS Job_Title,
skill.skills AS Skill_Name
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
INNER JOIN company_dim c
ON c.company_id = j.company_id
WHERE j.job_health_insurance=TRUE
AND j.job_location='New York';

/* =====================================================
Problem 6: Average Salary By Skill

Find:

* Skill Name
* Average Salary
  ===================================================== */

SELECT
skill.skills AS skill_name,
ROUND(AVG(j.salary_year_avg)) AS avg_salary
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
WHERE j.salary_year_avg IS NOT NULL
GROUP BY skill.skills
ORDER BY avg_salary DESC;

/* =====================================================
Problem 7: Job Requiring Most Skills

Find the job posting that requires
the highest number of skills
===================================================== */

SELECT
j.job_id,
j.job_title AS job_title,
COUNT(skill.skills) AS total_skills
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
GROUP BY j.job_id,job_title
ORDER BY total_skills DESC
LIMIT 1;

/* =====================================================
Problem 8: Skills Required For Data Analyst Jobs

Show all skills required for jobs
containing 'Data Analyst' in title
===================================================== */

SELECT
j.job_title AS job_title_short,
skill.skills AS skills
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
WHERE j.job_title_short LIKE '%Data Analyst%';

/* =====================================================
Problem 9: Jobs Per Skill

For each skill count how many jobs
require it
===================================================== */

SELECT
skill.skills AS skills,
COUNT(j.job_id) AS total_jobs
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
GROUP BY skill.skills
ORDER BY total_jobs DESC;

/* =====================================================
Problem 10: Top 5 Highest Paying Jobs And Skills

Find:

* Job Title
* Salary
* Required Skill

For Top 5 highest-paying jobs
===================================================== */

SELECT
J.job_title_short AS job_title,
J.salary_year_avg AS salary,
skill.skills AS skills
FROM (
SELECT
job_id,
job_title_short,
salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 5
) J
INNER JOIN skills_job_dim s
ON J.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id;

/*Bonus Problem 11

Find companies that have posted more than 50 jobs.*/

SELECT 
	c.name AS Company_Name,
    count(j.job_id)AS Total_Jobs
FROM job_postings_fact j INNER JOIN company_dim c on j.company_id=c.company_id
GROUP BY c.name
HAVING count(j.job_id) > 50
ORDER BY Total_Jobs DESC

/*Bonus Problem 12

Find skills that appear in at least 100 job postings.*/
SELECT
skill.skills AS Skill,
COUNT(j.job_id) AS total_jobs
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
GROUP BY skill.skills
HAVING COUNT(j.job_id)>=100
ORDER BY total_jobs DESC;

/*Bonus Problem 13

Find the highest paying Data Analyst job and list its required skills.*/
SELECT
j.job_title_short AS job_title_short,
j.salary_year_avg AS Salary,
skill.skills AS Skill
FROM job_postings_fact j
INNER JOIN skills_job_dim s
ON j.job_id = s.job_id
INNER JOIN skills_dim skill
ON s.skill_id = skill.skill_id
WHERE j.job_title_short = 'Data Analyst'
AND j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC ;

/*Bonus Problem 14

Find companies offering Health Insurance and count how many jobs they posted.*/
SELECT 
	c.name AS Company_Name,
    count(j.job_id)AS Total_Jobs
FROM job_postings_fact j INNER JOIN company_dim c on j.company_id=c.company_id
WHERE j.job_health_insurance=TRUE
GROUP BY c.name
ORDER BY Total_Jobs DESC

/*Bonus Problem 15

Find the top 5 skills associated with the highest average salary.*/
SELECT 
	skill.skills AS Skill,
	ROUND(AVG(j.salary_year_avg)) AS Avg_Salary
FROM job_postings_fact j INNER JOIN skills_job_dim s on j.job_id=s.job_id 
INNER JOIN skills_dim skill on skill.skill_id=s.skill_id
WHERE j.salary_year_avg is not null
GROUP by skill.skills
ORDER BY Avg_Salary DESC LIMIT 5


SELECT c.name AS company_name,
    count(J.company_id)AS Total_Job
FROM company_dim c LEFT JOIN job_postings_fact j ON c.company_id=j.company_id
GROUP by company_name
ORDER BY Total_Job DESC;
