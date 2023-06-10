-- 1.	How many rows are in the data_analyst_jobs table?

-- SELECT COUNT(*) AS total_postings
-- FROM data_analyst_jobs;

--Answer: 1763

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;

--Answer: ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

-- SELECT location, COUNT(*) AS location_count
-- FROM data_analyst_jobs
-- WHERE location in('TN','KY')
-- GROUP BY location;

--Answer: 21 in TN, 6 more in KY; 27 total

-- 4.	How many postings in Tennessee have a star rating above 4?

-- SELECT COUNT(*) AS tn_4_plus_count
-- FROM data_analyst_jobs
-- WHERE location='TN'
-- AND star_rating>4;

--Answer: 3

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

-- SELECT COUNT(*) AS reviews_500_to_1000_count
-- FROM data_analyst_jobs
-- WHERE review_count BETWEEN 500 AND 1000;

--Answer: 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

-- SELECT location, AVG(star_rating) AS avg_rating
-- FROM data_analyst_jobs
-- WHERE star_rating IS NOT NULL
-- GROUP BY location
-- ORDER BY avg_rating DESC;

--Answer: Nebraska

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

-- SELECT COUNT(DISTINCT(title)) AS unique_title_count
-- FROM data_analyst_jobs;

--Answer: 881

-- 8.	How many unique job titles are there for California companies?

-- SELECT COUNT(DISTINCT(title)) AS ca_unique_title_count
-- FROM data_analyst_jobs
-- WHERE location='CA';

--Answer: 230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

-- SELECT DISTINCT company, star_rating
-- FROM data_analyst_jobs
-- WHERE review_count>5000
-- AND company IS NOT NULL
-- ORDER BY company;

--Answer: 45

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- SELECT DISTINCT company, star_rating
-- FROM data_analyst_jobs
-- WHERE review_count>5000
-- AND company IS NOT NULL
-- ORDER BY star_rating DESC;

--Answer: American Express, General Motors, Kaiser Permanente, Microsoft, Nike, & Unileaver in a tie

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- SELECT DISTINCT(title)
-- FROM data_analyst_jobs
-- WHERE title iLIKE '%Analyst%';

--Answer: 774

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- SELECT DISTINCT(title)
-- FROM data_analyst_jobs
-- WHERE title NOT iLIKE '%analyst%'
-- AND title NOT iLIKE '%analytics%';

--Answer: Tableau

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

SELECT data_analyst_jobs.domain, COUNT(days_since_posting) AS longer_than_3_weeks_count
FROM data_analyst_jobs
WHERE days_since_posting>21
	AND skill ILIKE '%sql%'
GROUP BY data_analyst_jobs.domain;

--  - Disregard any postings where the domain is NULL.

SELECT data_analyst_jobs.domain, COUNT(days_since_posting) AS longer_than_3_weeks_count
FROM data_analyst_jobs
WHERE days_since_posting>21
	AND data_analyst_jobs.domain IS NOT NULL
	AND skill ILIKE '%sql%'
GROUP BY data_analyst_jobs.domain;

--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.

SELECT data_analyst_jobs.domain, COUNT(days_since_posting) AS longer_than_3_weeks_count
FROM data_analyst_jobs
WHERE days_since_posting>21
	AND data_analyst_jobs.domain IS NOT NULL
	AND skill ILIKE '%sql%'
GROUP BY data_analyst_jobs.domain
ORDER BY longer_than_3_weeks_count DESC
LIMIT 4;

--  - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- Consulting and Business Services	57
-- Health Care						52
-- Internet and Software			62
-- Banks and Financial Services		61