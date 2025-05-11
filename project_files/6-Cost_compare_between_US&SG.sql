SELECT *
FROM international_education_costs_copy
WHERE Country IN ('USA', 'Singapore');


SELECT Country,
        round(AVG(Tuition_USD),2) as Avg_Tuition_cost_USD,
        round(AVG(living_Cost_Index),2) as Avg_living_Cost_Index_USD,
        round(AVG(Rent_USD),2) as Avg_Rent_USD,
        round(AVG(Visa_Fee_USD + Insurance_USD),2) AS Avg_Visa_Insurance_Cost,
        round(
            AVG(Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD),2
            ) as Avg_total_cost_USD

FROM international_education_costs_copy
WHERE Country IN ('USA', 'Singapore')
GROUP BY Country
ORDER BY 1 DESC;


