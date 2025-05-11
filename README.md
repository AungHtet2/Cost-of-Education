# International Education Cost
## Introduction

### This project explores and compares the total cost of higher education for international students in selected universities across Algeria and Australia. It calculates the overall cost of studying abroad by combining tuition fees, rent, visa fees, and insurance over the full duration of each program. 
####  MySQL queries - [project_files folder](project_files)

## The questions I wanted to answer through my SQL queries were:

1. #### Which country or city offers the most affordable education overall?

2. #### What are the most popular program and its cost?


3. #### How do tuition fees compare between degree levels (Bachelor vs Master vs PhD)?

4. #### What’s the cost difference between studying in Algeria vs Australia?

5. #### How does living cost index correlate with rent or total cost?
6. #### Which program offers the best value for money (lowest cost per year)?

7. #### What’s the average rent and tuition in each city or university?

## 1. Which country or city offers the most affordable education overall?

- Top 10 Most Affordable Universities in the world under 10000 USD

```sql
SELECT *,
       round(
        Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD
        
        ) AS Total_Cost_USD

FROM international_education_costs_copy
WHERE Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD <= 10000
ORDER BY Total_Cost_USD ASC;
```
-  Top 10 Expensive Universities in the world over 30000 USD
```sql
SELECT *,
       round(
        Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD
        
        ) AS Total_Cost_USD

FROM international_education_costs_copy
WHERE Tuition_USD + (Rent_USD * 12 * Duration_Years) + Visa_Fee_USD + Insurance_USD >= 30000
ORDER BY Total_Cost_USD DESC;
```

## Affordable Master's and Bachelor's Programs

| Country     | City      | University                  | Program                | Level    | Duration | Tuition (USD) | Living Cost Index | Rent (USD) | Visa Fee (USD) | Insurance (USD) | Exchange Rate | Total Cost (USD) |
|-------------|-----------|-----------------------------|------------------------|----------|----------|----------------|--------------------|------------|----------------|------------------|----------------|-------------------|
| Tunisia     | Gabes     | University of Gabes         | Computer Engineering   | Master   | 2 yrs    | 1400           | 30.5               | 160        | 60             | 200              | 3.15           | 5500              |
| Algeria     | Annaba    | Badji Mokhtar University    | Computer Engineering   | Master   | 2 yrs    | 1000           | 34.5               | 180        | 80             | 200              | 137.5          | 5600              |
| Egypt       | Aswan     | Aswan University            | Data Analytics         | Master   | 2 yrs    | 1900           | 27.8               | 160        | 100            | 200              | 30.9           | 6040              |
| Bangladesh  | Rajshahi  | RUET                        | Software Engineering   | Master   | 2 yrs    | 2000           | 37.2               | 170        | 100            | 200              | 109.5          | 6380              |
| Tunisia     | Sfax      | University of Sfax          | Artificial Intelligence| Master   | 2 yrs    | 1400           | 33.2               | 200        | 60             | 200              | 3.15           | 6460              |
| Algeria     | Oran      | University of Oran          | Computer Engineering   | Master   | 2 yrs    | 1100           | 36.4               | 220        | 80             | 200              | 137.5          | 6660              |
| Bangladesh  | Khulna    | Khulna University           | Software Development   | Master   | 2 yrs    | 2100           | 38.5               | 180        | 100            | 200              | 109.5          | 6720              |
| Egypt       | Port Said | Port Said University        | Computer Science       | Master   | 2 yrs    | 2100           | 29.8               | 180        | 100            | 200              | 30.9           | 6720              |
| Tunisia     | Bizerte   | University of Carthage      | Artificial Intelligence| Bachelor | 3 yrs    | 1200           | 29.8               | 150        | 60             | 200              | 3.15           | 6860              |
| Algeria     | Tlemcen   | University of Tlemcen       | Information Systems    | Bachelor | 3 yrs    | 900            | 33.2               | 160        | 80             | 200              | 137.5          | 6940              |

## Expensive Master's and Bachelor's Programs
| Country | City       | University               | Program           | Level  | Duration_Years | Tuition_USD | Living_Cost_Index | Rent_USD | Visa_Fee_USD | Insurance_USD | Total_Cost_USD |
|---------|------------|--------------------------|-------------------|--------|-----------------|-------------|-------------------|----------|--------------|---------------|----------------|
| USA     | Stanford   | Stanford University      | Computer Science  | PhD    | 5               | 54200       | 89.5              | 2300     | 160          | 1500          | 193860         |
| USA     | Stanford   | Stanford University      | Physics           | PhD    | 5               | 52000       | 84.3              | 2300     | 160          | 1500          | 191660         |
| USA     | Boston     | MIT                      | Electrical Eng.   | PhD    | 5               | 53800       | 83.2              | 2200     | 160          | 1500          | 187460         |
| USA     | Los Angeles| UCLA                     | Computer Eng.     | PhD    | 5               | 52000       | 79.8              | 2200     | 160          | 1500          | 185660         |
| USA     | Stanford   | Stanford University      | Computer Science  | Bachelor | 4              | 57000       | 95.2              | 2400     | 160          | 1500          | 173860         |

## 2. What are most Popular Programs around the world and their average cost(USD)?

```sql
SELECT   DISTINCT(Program),
        count(*) AS Program_counts,
        ROUND(AVG(Tuition_USD),2) AS Avg_Tuition_cost_USD
        
FROM international_education_costs_copy
GROUP BY Program
ORDER BY 2 DESC
LIMIT 10;
```

| Rank | Program                | Counts | Avg. Tuition (USD) |
|------|------------------------|-------------------|--------------------|
| 1    | Computer Science       | 298               | $26,390.47         |
| 2    | Data Science           | 76                | $18,125.39         |
| 3    | Computer Engineering   | 62                | $11,220.65         |
| 4    | Software Engineering   | 52                | $11,216.73         |
| 5    | Artificial Intelligence| 51                | $13,401.18         |
| 6    | Data Analytics         | 46                | $14,258.70         |
| 7    | Information Systems    | 36                | $6,943.61          |
| 8    | Information Technology | 22                | $8,686.36          |
| 9    | Software Development   | 21                | $8,971.43          |
| 10   | Data Engineering       | 19                | $8,313.68          |







