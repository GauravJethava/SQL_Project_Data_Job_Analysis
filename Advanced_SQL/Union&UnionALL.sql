/*
 Find the count of the number of remote job postings per skill
 -Display the top 5 skills by their demand in remote jobs
 Include skill ID, name, and count of postings requiring the skill
 */
WITH remote_job AS(
    SELECT skill.skill_id,
        count(*) AS skill_count
    FROM skills_job_dim as skill
        INNER JOIN job_postings_fact j ON j.job_id = skill.job_id
    WHERE j.job_work_from_home = TRUE
        AND j.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)
SELECT r.skill_id,
    s.skills AS company_name,
    skill_count
from remote_job r
    INNER JOIN skills_dim s ON r.skill_id = s.skill_id
ORDER BY skill_count DESC
LIMIT 5;


/*Question: 
-Get the corresponding skill and skill type for each job posting in q1
- Includes those without any skills, too 
-Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000*/

--Solutin 1
WITH quater_job AS(
    SELECT *
    from january_job
    UNION ALL
    SELECT *
    from febuary_job
    UNION ALL
    SELECT *
    from march_job
)
SELECT q.job_id,
    q.job_title_short,
    q.salary_year_avg,
    s1.skills,
    s1.type
from quater_job q
    LEFT JOIN skills_job_dim s ON q.job_id = s.job_id
    LEFT JOIN skills_dim s1 ON s1.skill_id = s.skill_id
WHERE q.salary_year_avg > 70000
ORDER BY q.job_id;


--Solutin 2
SELECT q.job_id,
    q.job_title_short,
    q.salary_year_avg,
    s1.skills,
    s1.type
from job_postings_fact q
    LEFT JOIN skills_job_dim s ON q.job_id = s.job_id
    LEFT JOIN skills_dim s1 ON s1.skill_id = s.skill_id
WHERE q.salary_year_avg > 70000
    AND EXTRACT(
        QUARTER
        FROM q.job_posted_date
    ) = 1
ORDER BY q.job_id;


/*
Find job postings from the first quarter that have a salary greater than $70K
Combine job posting tables from the first quarter of 2023 (Jan-Mar)
Gets job postings with an average yearly salary > $70,000
*/

SELECT quater1_job_postings.job_id,
    quater1_job_postings.job_location,
    quater1_job_postings.job_via,
    quater1_job_postings.job_posted_date::Date
from (
        SELECT *
        from january_job
        UNION ALL
        SELECT *
        from febuary_job
        UNION ALL
        SELECT *
        from march_job
    ) AS quater1_job_postings
WHERE quater1_job_postings.salary_year_avg > 70000
    AND quater1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quater1_job_postings.salary_year_avg DESC;
