SELECT *
FROM international_education_costs_copy;

-- Popular Programs (top10)

SELECT   DISTINCT(Program),
        count(*) AS Program_counts,
        ROUND(AVG(Tuition_USD),2) AS Avg_Tuition_cost_USD
        
FROM international_education_costs_copy
GROUP BY Program
ORDER BY 2 DESC
LIMIT 10;

