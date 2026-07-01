SELECT *
FROM(
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(
                MONTH
                FROM job_posted_date
            ) = 1
    ) AS january_jobs
ORDER BY job_posted_date Desc;

SELECT J.job_title_short AS job_title,
    J.salary_year_avg AS salary,
    skill.skills AS skills
FROM (
        SELECT job_id,
            job_title_short,
            salary_year_avg
        FROM job_postings_fact
        WHERE salary_year_avg IS NOT NULL
        ORDER BY salary_year_avg DESC
        LIMIT 5
    ) J
    INNER JOIN skills_job_dim s ON J.job_id = s.job_id
    INNER JOIN skills_dim skill ON s.skill_id = skill.skill_id;

SELECT name AS Company_name
FROM company_dim
WHERE company_id IN (
        SELECT company_id
        from job_postings_fact
        WHERE job_no_degree_mention = TRUE
) 
ORDER BY Company_name ASC;

SELECT DISTINCT name AS Company_name
FROM company_dim c
    JOIN job_postings_fact j on c.company_id = j.company_id
WHERE j.job_no_degree_mention = TRUE
ORDER BY Company_name ASC;

SELECT company_name,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS SIZE
FROM (
        SELECT c.name AS company_name,
            count(j.job_id) AS job_count
        FROM company_dim c
            LEFT JOIN job_postings_fact j ON c.company_id = j.company_id
        GROUP BY c.company_id,
            c.name
        ORDER BY job_count DESC
    ) AS company_jobs

