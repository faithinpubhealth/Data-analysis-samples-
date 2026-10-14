-- Faith Forde 
Restaurant Inspection Results analysis -- 

--code to create table -- 

DROP TABLE IF EXISTS inspection_results;

CREATE TABLE inspection_results
(
"CAMIS" TEXT,
"DBA" TEXT,	
"BORO" TEXT,	
"BUILDING" TEXT, 	
"STREET" TEXT,	
"ZIPCODE" TEXT,	
"PHONE" TEXT,	
"CUISINE DESCRIPTION" TEXT,	
"INSPECTION DATE" DATE,		
"VIOLATION CODE" TEXT,	
"CRITICAL FLAG" TEXT,
"SCORE"	INTEGER,
"GRADE"	TEXT,
"GRADE DATE" DATE,	
"RECORD DATE" DATE,	
"Community Board" TEXT,	
"Council District" TEXT,	
"Census Tract" TEXT
);

--check data -- 

select *
from inspection_results;

-- COUNT RESTAURANTS -- 

select COUNT(*)
from inspection_results;

-- breakdown by year -- 

SELECT
	COUNT(CASE WHEN "INSPECTION DATE" >= '07/01/2021' AND "INSPECTION DATE" <= '06/30/2022' THEN 1 END) as count_year_1,
	COUNT(CASE WHEN "INSPECTION DATE" >= '07/01/2022' AND "INSPECTION DATE" <= '06/30/2023' THEN 1 END) as count_year_2,
	COUNT(CASE WHEN "INSPECTION DATE" >= '07/01/2023' AND "INSPECTION DATE" <= '06/30/2024' THEN 1 END) as count_year_3,
	COUNT(CASE WHEN "INSPECTION DATE" >= '07/01/2024' AND "INSPECTION DATE" <= '06/30/2025' THEN 1 END) as count_year_4,
	COUNT(CASE WHEN "INSPECTION DATE" >= '07/01/2025' AND "INSPECTION DATE" <= '06/30/2026' THEN 1 END) as count_year_5
FROM inspection_results


-- identifying the variety in the cuisine types, identifying the top 10 -- 
Select DISTINCT "CUISINE DESCRIPTION", COUNT("CUISINE DESCRIPTION") as cuisine_total
FROM inspection_results
GROUP BY  "CUISINE DESCRIPTION"
ORDER BY cuisine_total desc
LIMIT 10; 


--total count of each violations recorded over five years, identifying the top 10 most common--- 

Select "VIOLATION CODE", COUNT ("VIOLATION CODE") AS total_occurence
FROM inspection_results
group by "VIOLATION CODE"
ORDER BY total_occurence DESC
LIMIT 10;

--checking for VERMIN violation -- 

SELECT "CUISINE DESCRIPTION", COUNT ("CUISINE DESCRIPTION") as cuisine
FROM inspection_results
WHERE "VIOLATION CODE" = '04K'
GROUP BY "CUISINE DESCRIPTION"
ORDER BY cuisine desc
limit 5;

SELECT "CUISINE DESCRIPTION", COUNT ("CUISINE DESCRIPTION") as cuisine
FROM inspection_results
WHERE "VIOLATION CODE" = '04L'
GROUP BY "CUISINE DESCRIPTION"
ORDER BY cuisine desc
limit 5;

SELECT "CUISINE DESCRIPTION", COUNT ("CUISINE DESCRIPTION") as cuisine
FROM inspection_results
WHERE "VIOLATION CODE" = '04M'
GROUP BY "CUISINE DESCRIPTION"
ORDER BY cuisine desc
limit 5;

SELECT "CUISINE DESCRIPTION", COUNT ("CUISINE DESCRIPTION") as cuisine
FROM inspection_results
WHERE "VIOLATION CODE" = '04N'
GROUP BY "CUISINE DESCRIPTION"
ORDER BY cuisine desc
limit 5;

-- Creating a new table of restaurants inspected in the last year with A -- 
SELECT DISTINCT "CAMIS", "DBA","CUISINE DESCRIPTION", "SCORE", "INSPECTION DATE"
INTO current_grade_A_restaurants
FROM inspection_results
WHERE "SCORE" <= 13 AND "INSPECTION DATE" > '6/30/2025'
ORDER BY "INSPECTION DATE" DESC;

---checking the data for the new table -- 
select *
from current_grade_A_restaurants

