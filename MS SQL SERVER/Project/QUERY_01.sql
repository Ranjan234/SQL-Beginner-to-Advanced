
-- USE Swiggy_Database
USE Swiggy_Database;

SELECT *
FROM swiggy_data;

SELECT COUNT(*) 
FROM swiggy_data;

-- DATA VALIDATION & CLEANING
-- CHECK NULL VALUES
-- ()
SELECT 
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS null_state,
	SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS null_city,
	SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
	SUM(CASE WHEN Restaurant_Name IS NULL THEN 1 ELSE 0 END) AS null_restaurant,
	SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS null_location,
	SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
	SUM(CASE WHEN Dish_Name IS NULL THEN 1 ELSE 0 END) AS null_dish_name,
	SUM(CASE WHEN Price_INR IS NULL THEN 1 ELSE 0 END) AS null_price_inr,
	SUM(CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) AS null_rating,
	SUM(CASE WHEN Rating_COunt IS NULL THEN 1 ELSE 0 END) AS null_rating_count
FROM swiggy_data;

-- Blank or Empty Strings
SELECT *
FROM swiggy_data
WHERE State = '' OR City = '' OR Restaurant_Name = '' OR Location = '' OR
      Category = '' OR  Dish_Name = '' ;
	  
	  -- OR Rating = '' OR Rating_Count = '';

-- Duplicate Detection 
 SELECT State , City, Order_Date, Restaurant_Name,
        Location, Category, Dish_Name, Price_INR, Rating, Rating_Count, COUNT(*) AS Cnt
 FROM swiggy_data
 GROUP BY State , City, Order_Date, Restaurant_Name,
        Location, Category, Dish_Name, Price_INR, Rating, Rating_Count
 HAVING COUNT(*) > 1;

 -- DELETE Duplication

 WITH CTE AS (
          SELECT *, ROW_NUMBER() OVER(PARTITION BY State , City, Order_Date, Restaurant_Name,
                  Location, Category, Dish_Name, Price_INR, Rating, Rating_Count ORDER BY (SELECT NULL)) AS rn
 FROM swiggy_data
 )
 DELETE FROM CTE WHERE rn > 1;

 SELECT *
 FROM swiggy_data;

 -- CREATEING SCHEMA
 --  DIMENSION TABLES
 -- DATE TABLE
 CREATE TABLE dim_date(date_id INT IDENTITY(1,1) PRIMARY KEY,
                       Full_Date  DATE,
					   Year INT,
					   Month INT,
					    Month_Name VARCHAR(20),
						Quarter INT,
						 Day INT,
						 Week INT);
SELECT * FROM dim_date;
-- ()
-- DIM_LOCATION
CREATE TABLE dim_location(
                 location_id INT IDENTITY(1,1) PRIMARY KEY,
				 State VARCHAR(100), 
				 City VARCHAR(100),
				 Location VARCHAR(200)
);

SELECT *
FROM dim_location;

-- CREATE TABLE DIM RESTAURANT
CREATE TABLE dim_restaurant(
                  restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
				  Restaurant_Name VARCHAR(200) 
 
 );

 SELECT *
 FROM dim_restaurant;

 -- CREATE TABLE CATEGORY
 CREATE TABLE dim_category(
          category_id INT IDENTITY(1,1) PRIMARY KEY,
		  Category  VARCHAR(200)
		  );
SELECT *
FROM dim_category;

-- CREATE TABLE CATEGORY
CREATE TABLE dim_dish(
            dish_id INT IDENTITY(1,1) PRIMARY KEY,
			Dish_Name VARCHAR(200)
	   );

SELECT *
FROM dim_dish;

-- CREATE FACT ORDERS TABLE

CREATE TABLE fact_orders(
              order_id INT IDENTITY(1,1) PRIMARY KEY,
			  date_id INT,
			  Price_INR DECIMAL(10,2),
			  Rating DECIMAL(4,2),
			  Rating_Count INT,

			  location_id INT,
			   restaurant_id INT,
			   category_id INT,
			   dish_id INT,
			  
			  FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
			  FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
			  FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
			  FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
			  FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);  

SELECT *
FROM fact_orders;

-- ()
SELECT *
FROM swiggy_data;


-- INSERT DATA IN TABLES
-- dim_date
INSERT INTO dim_date(Full_Date, Year, Month,
					    Month_Name,	Quarter, Day,
						 Week)
SELECT DISTINCT 
          Order_Date,
		  YEAR(Order_Date),
		  MONTH(Order_Date),
		  DATENAME(MONTH, Order_Date),
		 DATEPART(QUARTER, Order_Date),
		 DAY(Order_Date),
		 DATEPART(Week, Order_Date)
FROM swiggy_data
WHERE Order_Date IS NOT NULL;

SELECT *
FROM dim_date;

-- INSERT INTO dim_location 
INSERT INTO dim_location(State, 
				 City,
				 Location)
SELECT DISTINCT
        State,
		City, Location
FROM swiggy_data;

SELECT *
FROM dim_location;

-- INSERT INTO CATEGORY
INSERT INTO dim_category(Category)
SELECT DISTINCT
        Category
FROM swiggy_data;

SELECT *
FROM dim_category;

-- INSERT INTO RESTAURANT
INSERT INTO dim_restaurant(Restaurant_Name)
SELECT DISTINCT
       Restaurant_Name
FROM swiggy_data;

SELECT *
FROM dim_restaurant;

-- INSERT INTO dim_dish
INSERT INTO dim_dish(Dish_Name)
SELECT DISTINCT
        Dish_Name
FROM swiggy_data;

SELECT *
FROM dim_dish;
-- -- ()
-- INSERT INTO ORDERS

INSERT INTO fact_orders
 (       
			  date_id,
			  Price_INR,
			  Rating,
			  Rating_Count,
			  location_id,
			  restaurant_id,
			   category_id,
			   dish_id
)
SELECT DISTINCT
       dd.date_id, sd.Price_INR, sd.Rating, sd.Rating_Count, 
	   dl.location_id, dr.restaurant_id, dc.category_id,
	   ds.dish_id

FROM swiggy_data sd
JOIN dim_date dd ON dd.Full_Date = sd.Order_Date

JOIN dim_location dl ON dl.State = sd.State 
                     AND dl.City =  sd.City 
					 AND dl.Location = sd.Location
JOIN dim_category dc ON  dc.Category = sd.Category 
JOIN dim_dish ds ON  ds.Dish_Name = sd.Dish_Name 
JOIN dim_restaurant dr ON  dr.Restaurant_Name = sd.Restaurant_Name;

SELECT *
FROM fact_orders;

SELECT COUNT(*) 
FROM fact_orders;

DROP TABLE IF EXISTS fact_orders;

TRUNCATE TABLE fact_orders;

SELECT *
FROM fact_orders f
JOIN dim_date dd ON f.date_id = dd.date_id
JOIN dim_location dl ON f.location_id = dl.location_id
JOIN dim_restaurant dr ON f.restaurant_id  = dr.restaurant_id
JOIN dim_category dc ON f.category_id = dc.category_id
JOIN dim_dish ds ON f.dish_id = ds.dish_id;

-- == KPI's 
-- Total Orders
SELECT   COUNT(*)  AS Total_orders
FROM fact_orders;
-- ()
-- Total Revenue 
SELECT FORMAT(SUM(CONVERT(FLOAT, Price_INR)) / 1000000, 'N2') + ' INR Million' 
FROM fact_orders;

SELECT FORMAT(AVG(CONVERT(FLOAT, Price_INR)), 'N2') + ' INR' 
FROM fact_orders;
 

 -- AVERAGE RATING
SELECT 
      AVG(Rating)
FROM fact_orders;

-- GRANURAL REQUERMENT

