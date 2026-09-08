-- DATA CLAENNING

-- USE DATA BASE world_layoffs
use world_layoffs;

-- 1. Remove duplicate values
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove Any columns

select * from layoffs;

select count(*) 
from layoffs;

-- Copying data another table
create table layoffs_staging
like layoffs;

insert layoffs_staging
select * from layoffs;
-- use layoffs_staging table
select * from layoffs_staging;

-- REMOVE DUPLICATE VALUES
SELECT * ,
  ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
FROM layoffs_staging;

WITH cte_duplicate AS (
SELECT * ,
  ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date',
    stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
SELECT * FROM cte_duplicate WHERE row_num >1;

-- DELETE duplicate rows
WITH cte_duplicate AS (
SELECT * ,
  ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date',
    stage, country, funds_raised_millions) as row_num
FROM layoffs_staging
)
DELETE FROM cte_duplicate WHERE row_num >1;

select * from layoffs_staging
WHERE company = 'Casper';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT * ,
  ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date',
    stage, country, funds_raised_millions) as row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2 
WHERE row_num >1;

DELETE FROM layoffs_staging2 
WHERE row_num >1;

SELECT *
FROM layoffs_staging2;

SELECT COUNT(*)
FROM layoffs_staging2;

-- STANDARDISING DATA ---
SELECT *
FROM layoffs_staging2;

-- COMPANY COLUMN
SELECT  company, TRIM(company) 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company  = TRIM(company) ;

-- industry COLUMN
SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- CHECK AGAIN
SELECT DISTINCT(industry)
FROM layoffs_staging2;

-- LOCATION COLUMN
SELECT DISTINCT(location)
FROM layoffs_staging2
ORDER BY 1;

-- COUNTRY COLUMN
SELECT DISTINCT(country)
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
WHERE country LIKE 'United States%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`,
    STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');
-- CHECK AGAIN
SELECT `date`
FROM layoffs_staging2
WHERE `date` IS NULL;

-- CHEANGE THE DATA TYPE USING ALTER
ALTER TABLE layoffs_staging2
MODIFY  COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;