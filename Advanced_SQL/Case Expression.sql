/*
Label new column as follows:
'Anywhere' jobs as 'Remote'
'New York, NY' jobs as 'Local'
Otherwise 'Onsite'
*/

SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;


SELECT 
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category,
    count(job_id) As job_count
FROM job_postings_fact
GROUP BY location_category;

SELECT 
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category,
    count(job_id) As job_count
FROM job_postings_fact
WHERE job_title_short='Data Analyst'
GROUP BY location_category;


SELECT CASE
        WHEN salary_year_avg BETWEEN 50000 AND 250000 THEN 'Standard Salary Range'
        WHEN salary_year_avg >= 250000 THEN 'High Salary Range'
        ELSE 'Low Salary Range'
    END AS salary_range,
    count(job_id) As job_count
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY salary_range
ORDER BY salary_range DESC;

