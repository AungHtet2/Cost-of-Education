-- Which country or city offers the most affordable education overall?
-- Combine tuition, rent, visa, insurance, and cost index.



SELECT *
FROM international_education_costs_copy
LIMIT 10;

-- Top Most Affordable Universities in the world under 10000 USD

SELECT *,
       round(
        Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD
        
        ) AS Total_Cost_USD

FROM international_education_costs_copy
WHERE Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD <= 10000
ORDER BY Total_Cost_USD ASC;


-- Top Expensive Universities in the world over 30000 USD

SELECT *,
       round(
        Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD
        
        ) AS Total_Cost_USD

FROM international_education_costs_copy
WHERE Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD >= 30000
ORDER BY Total_Cost_USD DESC;