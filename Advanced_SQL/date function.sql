SELECT job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS date,
    EXTRACT(
        MONTH
        FROM job_posted_date
    ) AS date_month,
    EXTRACT(
        DAY
        FROM job_posted_date
    ) AS day_date,
    EXTRACT(
        YEAR
        FROM job_posted_date
    ) AS year_date
FROM job_postings_fact
LIMIT 5;


SELECT count(job_id) AS job_posted_count,
    EXTRACT(
        MONTH
        from job_posted_date
    ) AS Month_date
FROM job_postings_fact
WHERE job_title_short= 'Data Analyst'
GROUP BY Month_date
ORDER BY Month_date;


SELECT 
    job_schedule_type AS job_type,
    ROUND(AVG(salary_year_avg))AS yearly_avg,
    ROUND(AVG(salary_hour_avg))AS hourly_avg
 FROM job_postings_fact 
 WHERE job_posted_date > '2023-06-01'
 GROUP BY job_schedule_type;


SELECT EXTRACT(
        MONTH
        from (
                job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
            )
    ) AS Month_date,
    count(job_id) AS job_id
FROM job_postings_fact
WHERE EXTRACT(
        YEAR
        from (
                job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
            )
    ) = 2023
GROUP BY Month_date
ORDER BY Month_date;


SELECT DISTINCT(c.name) AS comapny_name
from job_postings_fact j
    INNER JOIN company_dim c ON j.company_id = c.company_id
WHERE job_posted_date >= '2023-04-01'
    AND job_posted_date < '2023-07-01'
    AND job_health_insurance = TRUE;



