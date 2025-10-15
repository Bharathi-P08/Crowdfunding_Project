--  Total Number of Projects based on outcome
SELECT 
    p.state AS outcome,
    CASE 
        WHEN COUNT(*) >= 1000 
            THEN CONCAT(ROUND(COUNT(*)/1000, 1), 'K')
        ELSE COUNT(*)
    END AS total_projects
FROM crowdfunding_projects p
GROUP BY p.state;

-- Total Number of Projects based on Locations
select country, count(*) as total_projects
from crowdfunding_projects
group by country
ORDER BY total_projects DESC
LIMIT 10;

-- Total Number of Projects based on  Category
SELECT c.name AS category_name,
       COUNT(*) AS total_projects
FROM crowdfunding_projects p
JOIN category c 
      ON p.category_id = c.id
GROUP BY c.name
ORDER BY total_projects DESC
LIMIT 10;

-- Total Number of Projects created by Year , Quarter , Month
select year(created_date) as Year,
monthname(created_date) as Month,
quarter(created_date) as Quarter,
count(*) as Total_projects
from crowdfunding_projects
Group by Year, Month, Quarter;

-- successful projects by Amount Raised
select Concat(ROUND(SUM(goal_usd) / 1000000000, 2),'B') as Amount_raised
from crowdfunding_projects
where state="successful";

-- successful projects by No.of Backers
select count(distinct backers_count) as Totalbackers
from crowdfunding_projects
where state="successful";

-- successful projects by Avg No of Days for successful projects
select	Round(avg(datediff(deadline_date, created_date))) as Avgdays 
from crowdfunding_projects
where state="successful";

-- Top Successful Projects based on No.of backers
select name, backers_count
from crowdfunding_projects
where state='successful'
order by backers_count desc
limit 5;

-- Top Successful Projects based on Amount raised
select name, usd_pledged
from crowdfunding_projects
where state='successful'
order by usd_pledged desc
limit 5;

-- Percentage of Successful Projects overall
SELECT 
    CONCAT(ROUND(
        (SUM(CASE WHEN state='successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ), '%') AS overall_project
FROM crowdfunding_projects;

-- Percentage of Successful Projects by Category
select c.name,
CONCAT(ROUND(
        (SUM(CASE WHEN p.state='successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ), '%') AS Successful_Projects_Category
from crowdfunding_projects p
join category c on p.category_id = c.id
group by c.name
limit 5;

-- Percentage of Successful Projects by Year , Month
SELECT 
    YEAR(created_date) AS Project_Year,
    CONCAT(
        ROUND(
            100.0 * SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ),
        '%'
    ) AS success_percentage
FROM crowdfunding_projects
GROUP BY YEAR(created_date)
ORDER BY Project_Year;

-- Percentage of Successful projects by Goal Range
select
case
when  goal < 1000 then '<1k'
when goal between 1000 and 4999 then '1k - 5k'
when goal between 5000 and 9999 then '5k - 10k'
when goal between 10000 and 49000 then '10k - 50k'
Else '50k+'
end as goal_range,
CONCAT(
        ROUND(
            100.0 * SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ),
        '%'
    ) AS success_percentage
FROM crowdfunding_projects
GROUP BY goal_range
ORDER BY min(goal);