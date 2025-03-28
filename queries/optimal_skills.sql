
WITH top_skills AS
    (SELECT skills_dim.skill_id,skills,ROUND(AVG(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
    GROUP BY skills_dim.skill_id,skills
   
    )

,top_demanded_skills AS

    (SELECT skills_dim.skill_id,skills,COUNT(job_postings_fact.job_id) AS demand
    FROM job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND
        job_work_from_home = True
    GROUP BY skills_dim.skill_id,skills
    
    )

SELECT top_skills.skills,demand,avg_salary FROM top_skills
INNER JOIN top_demanded_skills
on top_skills.skill_id = top_demanded_skills.skill_id
ORDER BY demand DESC,avg_salary DESC
LIMIT 25;