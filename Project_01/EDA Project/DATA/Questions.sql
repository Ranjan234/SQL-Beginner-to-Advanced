
USE EDA_PROJECT;

SELECT *
FROM accident;

SELECT COUNT(*)
FROM accident;

SELECT *
FROM vehicle;

-- Q1. How many accidents have occurred in urban areas versus rural areas?  

SELECT Area, 
      COUNT(AccidentIndex) AS Total_Accidents
FROM accident
GROUP BY Area;

-- Q2. Which day of the weak has highest number of accidents?
SELECT Day,
     COUNT(AccidentIndex) AS Total_Accident
FROM accident
GROUP BY Day
ORDER BY Total_Accident DESC;

-- Q3. What is the average age of vehicles involved in accidents based in thier type?
SELECT VehicleType,
       AVG(AgeVehicle) avg_year,
	   COUNT(AccidentIndex) AS Total_Accident
FROM vehicle
WHERE 
    AgeVehicle IS NOT NULL
GROUP BY VehicleType
ORDER BY Total_Accident DESC;

-- Q4. Can we identify any trends in accidents based on the age of vehicle involved?

SELECT Age_Group,
       AVG(AgeVehicle) avg_year,
	   COUNT(AccidentIndex) AS Total_Accident
FROM (
    SELECT 
	     AgeVehicle,
	     AccidentIndex,
	   CASE
	     WHEN  AgeVehicle BETWEEN 0 AND 6 THEN 'New'
		 WHEN AgeVehicle BETWEEN 6 AND 10 THEN 'Regular'
	   ELSE  'Old'
	   END AS 'Age_Group'
    FROM vehicle
) AS t
GROUP BY Age_Group
;

-- Q5. Are there any specific weather conditions that contribute to severe accidents?
 -- ()

 DECLARE @Severity varchar(100)
 SET @Severity = 'Fatal'

SELECT WeatherConditions,
       COUNT(Severity) AS Total_accidents
FROM accident
WHERE Severity = @Severity
GROUP BY WeatherConditions
ORDER BY Total_accidents DESC;

--- 
 DECLARE @Severity varchar(100)
 SET @Severity = 'Serious'

SELECT WeatherConditions,
       COUNT(Severity) AS Total_accidents
FROM accident
WHERE Severity = @Severity
GROUP BY WeatherConditions
ORDER BY Total_accidents DESC;
--- 
 DECLARE @Severity varchar(100)
 SET @Severity = 'Slight'

SELECT WeatherConditions,
       COUNT(Severity) AS Total_accidents
FROM accident
WHERE Severity = @Severity
GROUP BY WeatherConditions
ORDER BY Total_accidents DESC;


-- Q6. Do accidents often involve on the left-hand side of veehicle?

SELECT LeftHand,
    COUNT(AccidentIndex) AS Total_Accidents
FROM vehicle
GROUP BY LeftHand
 HAVING 
       LeftHand IS NOT NULL;

-- Q7. Are there any relationship between journey purposes and the severity of accidents?
SELECT 
        v.JourneyPurpose,
       COUNT(a.Severity) AS Total_Accidents,
	    CASE  
		  WHEN COUNT(a.Severity) BETWEEN 0 AND 1000 THEN 'Low'
		  WHEN COUNT(a.Severity) BETWEEN 1001 AND 2000 THEN 'Moderate'
		  ELSE 'High'
		  END AS 'Level'
FROM accident a
LEFT JOIN vehicle v
ON a.AccidentIndex = v.AccidentIndex
GROUP BY v.JourneyPurpose
ORDER BY Total_Accidents DESC;

-- Q8. Calculate the average age of vehicles involved in accidents, considering Day light and point of impact.
DECLARE @Impact varchar(100)
DECLARE @Light varchar(100)
SET @Impact = 'offside' 
SET @Light = 'darkness'

SELECT a.LightConditions ,
        v.PointImpact ,
      AVG(v.AgeVehicle) AS avg_year
FROM accident a
LEFT JOIN vehicle v
ON a.AccidentIndex = v.AccidentIndex
WHERE 
     v.AgeVehicle IS NOT NULL
GROUP BY a.LightConditions,
          v.PointImpact
HAVING 
      PointImpact =  @Impact AND LightConditions = @Light;

DECLARE @Impact varchar(100)
DECLARE @Light varchar(100)
SET @Impact = 'offside' 
SET @Light = 'Daylight'

SELECT a.LightConditions ,
        v.PointImpact ,
      AVG(v.AgeVehicle) AS avg_year
FROM accident a
LEFT JOIN vehicle v
ON a.AccidentIndex = v.AccidentIndex
WHERE 
     v.AgeVehicle IS NOT NULL
GROUP BY a.LightConditions,
          v.PointImpact
HAVING 
      PointImpact =  @Impact AND LightConditions = @Light;



