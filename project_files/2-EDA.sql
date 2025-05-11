SELECT *
FROM international_education_costs_copy
LIMIT 10;

-- Countries with most universities

SELECT  Country,
        count(Country)
FROM 
    international_education_costs_copy
GROUP BY 
    Country
ORDER BY 
    2 DESC
LIMIT 20;


-- Program counts

SELECT  Program,
        count(Program)

FROM international_education_costs_copy
GROUP BY Program
ORDER BY 2 DESC;

-- Most Expensive Tuition_USD University around the world

SELECT  Country,
        University,
        Tuition_USD

FROM international_education_costs_copy
ORDER BY 3 DESC;


-- Program with most duration years

SELECT 
        Program,
        Duration_Years
FROM international_education_costs_copy
ORDER BY 2 DESC;


-- Living Cost and rent_usd around the world

SELECT
        Country,
        City,
        Living_Cost_Index,
        Rent_USD

FROM international_education_costs_copy
ORDER BY 4 DESC;




