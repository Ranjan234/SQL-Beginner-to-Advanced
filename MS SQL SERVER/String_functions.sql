use MyDatabase;

-- CONCAT()- Combines mlutiple strings into one
/*Show a list of customers firstnames together with their country in one column. */

SELECT
  first_name,
  country,
  CONCAT(first_name, ' - ', country) AS name_country
FROM customers;

-- UPPER() - Converts all characters to uppercase.
-- LOWER() - Converts all characters to lowercase.


/*Converts the firstname to lowercase viceversa.*/
SELECT
  first_name,
  country,
  CONCAT(first_name, ' - ', country) AS name_country,
  LOWER(first_name) AS low_name,
  UPPER(first_name) AS up_name
FROM customers;

-- TRIM() - Removes leading and trailing spaces
/* Find customers whose first name contains leading or trailing spaces*/
SELECT 
     first_name
FROM customers
WHERE first_name != TRIM(first_name);

SELECT 
     first_name,
	 lEN(first_name) AS len_name,
	 LEN(TRIM(first_name) ) AS len_trim_name,
	 LEN(first_name) - LEN(TRIM(first_name))  AS flag
FROM customers

-- REPLACE - Replaces specific character with a new character.
--- Remove dashes (-) from a phone number.
SELECT 
'238-458-688' AS phone_number,
REPLACE('238-458-688', '-',' ') AS clean_number; 

--- Replace file extence from txt  to csv.
SELECT
'report.txt' AS old_file,
REPLACE('report.txt', '.txt','.csv') AS new_file

-- LEN - counts how many characters
SELECT
   first_name,
  LEN(first_name) AS len_name
FROM customers;

-- LEFT()- Extract specific number of character from the start.
SELECT 
   first_name,
   LEFT(first_name, 2) AS first_2_char
   FROM customers;