SELECT  Program,
        Country,
        University,
        count(*) AS Program_counts,
        round(AVG(Tuition_USD / Duration_Years),2) AS Avg_Cost_Per_Year_USD


FROM international_education_costs_copy
GROUP BY Program,Country,University
ORDER BY Avg_Cost_Per_Year_USD ASC
LIMIT 10;