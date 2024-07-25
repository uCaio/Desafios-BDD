show tables;
select * from country;
select * from city;

-- i)
SELECT 
    city.Name AS CityName, 
    country.Name AS CountryName
FROM 
    city
JOIN 
    country ON city.CountryCode = country.Code
WHERE 
    YEAR(CURDATE()) - country.IndepYear > 400;
    
-- ii)
SELECT 
	city.Name AS CityName,
    country.Name AS CountryName,
    city.Population AS CityPopulation,
    country.Capital AS CapitalCity,
    (city.Population / country.SurfaceArea) AS PopulationDensity
FROM 
	city
JOIN
	country ON city.CountryCode = country.Code
WHERE
	city.Population > 1000000;
    
-- iii)
SELECT 
	city.Name AS CityName,
    country.Name AS CountryName
FROM 
	city
JOIN 
	country ON city.CountryCode = country.Code
ORDER BY
	country.LifeExpectancy DESC
LIMIT 10;

-- IV)
SELECT 
    country.Name AS CountryName,
    country.Population AS CapitalName,
    capital_city.name AS CountryPopulation
FROM 
	country
JOIN 
	city AS capital_city ON country.Capital = capital_city.ID
ORDER BY 
	country.Population DESC
LIMIT 10;

    
	
	
	







