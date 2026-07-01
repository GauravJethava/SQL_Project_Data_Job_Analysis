WITH january_jobs AS(
    -- CTE Define Starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(
            MONTH
            FROM job_posted_date
        ) = 1
)

SELECT * from january_jobs;


