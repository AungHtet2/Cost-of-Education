
-- What’s the average rent and tuition in each city or university in USA and Singapore?

SELECT  City,
        University,
        round(AVG(Rent_USD),2) AS Avg_Rent_USD,
        round(AVG(Tuition_USD),2) AS Avg_Tuition_USD


FROM international_education_costs_copy
WHERE Country = 'USA'
GROUP BY City,University
ORDER BY Avg_Rent_USD DESC
LIMIT 10;


SELECT  City,
        University,
        round(AVG(Rent_USD),2) AS Avg_Rent_USD,
        round(AVG(Tuition_USD),2) AS Avg_Tuition_USD


FROM international_education_costs_copy
WHERE Country = 'Singapore'
GROUP BY City,University
ORDER BY Avg_Rent_USD ASC;


SELECT *
FROM international_education_costs_copy;
