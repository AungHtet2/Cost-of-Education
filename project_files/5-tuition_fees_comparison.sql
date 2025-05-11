SELECT *
FROM international_education_costs_copy;

SELECT DISTINCT LEVEL
FROM international_education_costs_copy;


SELECT 
    Level,
    COUNT(*) AS Program_Count,
    ROUND(AVG(Tuition_USD), 2) AS Avg_Tuition_Per_Year_USD
FROM international_education_costs_copy
GROUP BY Level
ORDER BY Avg_Tuition_Per_Year_USD DESC;