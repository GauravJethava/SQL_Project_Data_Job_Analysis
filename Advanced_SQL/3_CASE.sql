CREATE table march_job as 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 3
    ORDER BY job_posted_date ASC;