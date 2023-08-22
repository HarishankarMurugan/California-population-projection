-- Creating a new database!
CREATE SCHEMA ca_population;

-- now we have to use the database, without this query the db cannot be used.
USE ca_population;

-- In ca_population db, we are creating the pop_proj.
CREATE TABLE pop_proj(
	county_code VARCHAR(45) NOT NULL,
    county_name VARCHAR(45) NOT NULL,
    date_year INT NOT NULL,
    race_code INT NOT NULL,
    race TEXT NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL,
    population INT NOT NULL
);

/* Before loading the data, check this */

/*
If there is any issues with loading local data is disabled, we need to enable it.

1) log into to mysql from command line >> mysql -u <username> -p
2) check local_infile varialbe current status >> show global variables like 'local_infile';
3) if that is OFF,enable it >> SET GLOBAL local_infile=1;
4) quit the server >> quit
5) connect to server again >> mysql --local_infile=1 -u root -p
6) run the load sql statement.
*/

/* Load Data */
/* ignore first header line, delimiter setting, etc*/
LOAD DATA LOCAL INFILE 'C:\\Users\\User\\CA_DRU_proj_2010-2060.csv' -- we have enter where the file store locally.
INTO TABLE pop_proj
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/* check the loaded data */
SELECT * FROM pop_proj
LIMIT 10;

-- ====================================================================================================

/* I was creating the view table, After I selecting the respective data. 
   So that, we will not write long select query everytime to get the data. **/

-- =====================================================================================================

-- getting the population of each county every 5 years

CREATE VIEW every_5years AS
SELECT
    county_code, county_name, 
    SUM(CASE WHEN date_year = 2010 THEN population ELSE 0 END) AS '2010',
    SUM(CASE WHEN date_year = 2015 THEN population ELSE 0 END) AS '2015',
    SUM(CASE WHEN date_year = 2020 THEN population ELSE 0 END) AS '2020',
    SUM(CASE WHEN date_year = 2025 THEN population ELSE 0 END) AS '2025',
    SUM(CASE WHEN date_year = 2030 THEN population ELSE 0 END) AS '2030',
    SUM(CASE WHEN date_year = 2035 THEN population ELSE 0 END) AS '2035',
    SUM(CASE WHEN date_year = 2040 THEN population ELSE 0 END) AS '2040',
    SUM(CASE WHEN date_year = 2045 THEN population ELSE 0 END) AS '2045',
    SUM(CASE WHEN date_year = 2050 THEN population ELSE 0 END) AS '2050',
    SUM(CASE WHEN date_year = 2055 THEN population ELSE 0 END) AS '2055',
    SUM(CASE WHEN date_year = 2060 THEN population ELSE 0 END) AS '2060'
FROM pop_proj
GROUP BY county_code, county_name; 



-- ==================================================================================================================

-- Male, and Female and their total population of CA in 2010,2022 and 2060.
CREATE VIEW total_pop AS
SELECT 
	county_code, county_name,
    -- Male, and Female and their total population of CA in 2010,
    SUM(CASE WHEN date_year = 2010 AND gender = 'Male' THEN population ELSE 0 END) AS 'males_in_2010',
    SUM(CASE WHEN date_year = 2010 AND gender = 'Female' THEN population ELSE 0 END) AS 'females_in_2010',
    SUM(CASE WHEN date_year = 2010 THEN population ELSE 0 END) AS 'total_pop_in_2010',
    -- Male, and Female and their total population of CA in 2023,
    SUM(CASE WHEN date_year = 2022 AND gender = 'Male' THEN population ELSE 0 END) AS 'males_in_2022',
    SUM(CASE WHEN date_year = 2022 AND gender = 'Female' THEN population ELSE 0 END) AS 'females_in_2022',
    SUM(CASE WHEN date_year = 2022 THEN population ELSE 0 END) AS 'total_pop_in_2022',
    -- Male, and Female and their total population of CA in 2060,
    SUM(CASE WHEN date_year = 2060 AND gender = 'Male' THEN population ELSE 0 END) AS 'males_in_2060',
    SUM(CASE WHEN date_year = 2060 AND gender = 'Female' THEN population ELSE 0 END) AS 'females_in_2060',
    SUM(CASE WHEN date_year = 2060 THEN population ELSE 0 END) AS 'total_pop_in_2060'
FROM pop_proj
GROUP BY county_code, county_name;

DROP TABLE total_pop;

-- =============================================================================================================== 

-- Total Population based on the race!
CREATE VIEW race_pop AS
SELECT 
	race_code, race,
    SUM(CASE WHEN date_year = 2010 THEN population ELSE 0 END) AS '2010',
	SUM(CASE WHEN date_year = 2022 THEN population ELSE 0 END) AS '2022',
    SUM(CASE WHEN date_year = 2060 THEN population ELSE 0 END) AS '2060'
FROM pop_proj
GROUP BY race_code, race;

-- =============================================================================================================== 

-- create view for the Population in 2022 in descending order,

CREATE VIEW pop_2022 AS 
SELECT
    county_name, 
    SUM(CASE WHEN date_year = 2022 THEN population ELSE 0 END) AS pop_in_2022
FROM pop_proj
GROUP BY county_name;

-- ==============================================

SELECT * FROM pop_2022;

-- ===========================================================

-- Selecting the maximum and the minimum population.

SELECT *
FROM pop_2022
WHERE pop_in_2022 = (SELECT MAX(pop_in_2022) FROM pop_2022)
   AND pop_in_2022 = (SELECT MIN(pop_in_2022) FROM pop_2022);
   
   