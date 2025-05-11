SELECT *
FROM international_education_costs;


CREATE TABLE  international_education_costs_copy(
  `Country` text,
  `City` text,
  `University` text,
  `Program` text,
  `Level` text,
  `Duration_Years` int DEFAULT NULL,
  `Tuition_USD` int DEFAULT NULL,
  `Living_Cost_Index` double DEFAULT NULL,
  `Rent_USD` int DEFAULT NULL,
  `Visa_Fee_USD` int DEFAULT NULL,
  `Insurance_USD` int DEFAULT NULL,
  `Exchange_Rate` double DEFAULT NULL,
  row_num int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO international_education_costs_copy
SELECT  *,
        row_number() over(
            PARTITION BY Country,
                         City,
                         University,
                         Program,
                         Level,
                         Duration_Years,
                         Tuition_USD,
                         Living_Cost_Index,
                         Rent_USD,
                         Visa_Fee_USD,
                         Insurance_USD,
                         Exchange_Rate
        ) as row_num
FROM international_education_costs


SELECT *
FROM international_education_costs_copy
WHERE row_num > 2;

-- NO Duplicates Data

-- standardize data

ALTER TABLE international_education_costs_copy
DROP COLUMN row_num;

DELETE 
FROM international_education_costs_copy
WHERE Tuition_USD = 0;

ALTER TABLE international_education_costs_copy
MODIFY COLUMN Duration_Years INT;

SELECT  University,
        COUNT(University) as Program_counts
FROM international_education_costs_copy
GROUP BY University
ORDER BY 2 DESC;


SELECT *
FROM international_education_costs_copy;