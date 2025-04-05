# postgres_proj

# Introduction

Dive into data of the job market to see which skills are high in demand.
SQL queries : check them out here [queries folder](/queries/)

# Background

This a project to demonstrate how to use sql queries to analyze a database and give insights about the job market for data analyst jobs.

# Tools I used

- **SQL**
- **Postgres**
- **Visual Studio Code**
- **Git and Github**

The 10 most in demand skills for data analyst

![](assets\jobs.png)

type of quesions answerd

```sql

SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS demand
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = True
GROUP BY skills
ORDER BY demand DESC
LIMIT 10;


```

# What I learned

I learned a lot through making this project on how to use sql particulary postgres with visual studio code and how to doucment my work.

# Conclusion

## Insights

    Our analysis showcases the demand of skills like sql,python,excel,power bi,tableau in data analyst job market but shows that these skills are essential so they are not the high paid ones.

## Closing Thoughts

    this a quite simple project but a starting point for adding more functionality and analysis.
