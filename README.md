# International Education Cost
## Introduction

### This project explores and compares the total cost of higher education for international students in selected universities across Algeria and Australia. It calculates the overall cost of studying abroad by combining tuition fees, rent, visa fees, and insurance over the full duration of each program. 
####  MySQL queries - [project_files folder](project_files)

## The questions I wanted to answer through my SQL queries were:

1. #### Which country or city offers the most affordable education overall?

2. #### What are the most popular program and its cost?


3. #### How do tuition fees compare between degree levels (Bachelor vs Master vs PhD)?

4. #### What’s the cost difference between studying in USA & Singapore?

5. #### Which program offers the best value for money (lowest cost per year)?

6. #### What’s the average rent and tuition in each city or university?

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


# 3. How do tuition fees compare between degree levels (Bachelor vs Master vs PhD)?


```sql
SELECT 
    Level,
    COUNT(*) AS Program_Count,
    ROUND(AVG(Tuition_USD), 2) AS Avg_Tuition_Per_Year_USD
FROM international_education_costs_copy
GROUP BY Level
ORDER BY Avg_Tuition_Per_Year_USD DESC;
```

##  Average Tuition Fees by Degree Level

| Degree Level | Number of Programs | Avg Tuition per Year (USD) |
|--------------|--------------------|-----------------------------|
| Bachelor     | 274                | $21,454.12                  |
| PhD          | 141                | $19,316.31                  |
| Master       | 389                | $16,836.56                  |


# 4. What’s the cost difference between studying in USA & Singapore?

```sql
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
```

### USA vs Singapore – Education Cost Comparison


| Country   | Avg Tuition Cost (USD) | Avg Living Cost Index | Avg Rent (USD) | Avg Visa + Insurance (USD) | Avg Total Cost (USD) |
|-----------|-------------------------|------------------------|----------------|------------------------------|------------------------|
| USA       | $47,742.31              | 77.8                   | $1,858.97       | $1,660.00                    | $124,171.54           |
| Singapore | $34,172.22              | 82.02                  | $1,394.44       | $890.00                      | $88,395.56            |
                     

# 5. Which program offers the best value for money (lowest cost per year)?

```sql
SELECT  Program,
        Country,
        University,
        count(*) AS Program_counts,
        round(AVG(Tuition_USD / Duration_Years),2) AS Avg_Cost_Per_Year_USD


FROM international_education_costs_copy
GROUP BY Program,Country,University
ORDER BY Avg_Cost_Per_Year_USD ASC
LIMIT 10;
```
## Tuition Costs for Various Programs in Luxembourg and Germany

#### The following table outlines the average annual tuition costs for different programs at universities in Luxembourg and Germany:

| Program              | Country    | University                     | Program Count | Avg Cost Per Year (USD) |
|----------------------|------------|---------------------------------|---------------|-------------------------|
| Computer Science      | Luxembourg | Luxembourg Institute of Science | 1             | 133.33                  |
| Digital Innovation    | Luxembourg | European Business University    | 1             | 133.33                  |
| Software Engineering  | Germany    | University of Stuttgart         | 1             | 150.00                  |
| Data Science          | Germany    | University of Jena              | 1             | 150.00                  |
| Information Systems   | Germany    | TU Darmstadt                    | 1             | 150.00                  |
| Computer Engineering  | Germany    | RWTH Aachen                     | 1             | 166.67                  |
| Molecular Biology     | Germany    | Heidelberg University           | 1             | 166.67                  |
| Artificial Intelligence| Luxembourg | University of Luxembourg        | 1             | 200.00                  |
| Information Technology| Luxembourg | Miami University Dolibois       | 1             | 200.00                  |
| Data Engineering      | Luxembourg | Luxembourg School of Business   | 1             | 200.00                  |


# 6. What’s the average rent and tuition in each city or university in USA and Singapore?

 - ### What’s the average rent and tuition in each city or university in USA?
```sql
SELECT  City,
        University,
        round(AVG(Rent_USD),2) AS Avg_Rent_USD,
        round(AVG(Tuition_USD),2) AS Avg_Tuition_USD


FROM international_education_costs_copy
WHERE Country = 'USA'
GROUP BY City,University
ORDER BY Avg_Rent_USD DESC
LIMIT 10;
```

| City             | University              | Avg Rent (USD) | Avg Tuition (USD) |
|------------------|-------------------------|----------------|-------------------|
| New York         | Columbia University     | 2,500.00       | 58,933.33         |
| San Francisco    | UC Berkeley Extension   | 2,400.00       | 52,000.00         |
| San Francisco    | Stanford University     | 2,400.00       | 55,000.00         |
| Stanford         | Stanford University     | 2,325.00       | 53,800.00         |
| Cambridge        | MIT                     | 2,300.00       | 55,800.00         |
| Cambridge        | Harvard University      | 2,200.00       | 55,400.00         |
| Los Angeles      | UCLA                    | 2,200.00       | 49,000.00         |
| Boston           | Harvard University      | 2,200.00       | 58,000.00         |
| Boston           | MIT                     | 2,150.00       | 55,900.00         |
| Berkeley         | UC Berkeley             | 2,100.00       | 49,100.00         |
#
 - ### What’s the average rent and tuition in each city or university in Singapore?
 ```sql
 SELECT  City,
        University,
        round(AVG(Rent_USD),2) AS Avg_Rent_USD,
        round(AVG(Tuition_USD),2) AS Avg_Tuition_USD


FROM international_education_costs_copy
WHERE Country = 'Singapore'
GROUP BY City,University
ORDER BY Avg_Rent_USD ASC;
 ```

 | City        | University                          | Avg Rent (USD) | Avg Tuition (USD) |
|-------------|-------------------------------------|----------------|-------------------|
| Singapore   | SIM Global Education                | 1,000.00       | 35,000.00         |
| Singapore   | Singapore University of Technology  | 1,100.00       | 39,000.00         |
| Singapore   | Nanyang Technological University    | 1,300.00       | 36,250.00         |
| Singapore   | Singapore Management University     | 1,325.00       | 34,900.00         |
| Singapore   | SUTD                                | 1,350.00       | 34,000.00         |
| Singapore   | NTU                                 | 1,500.00       | 36,400.00         |
| Singapore   | NUS                                 | 1,500.00       | 37,050.00         |
| Singapore   | SIT                                 | 1,500.00       | 29,800.00         |
| Singapore   | SMU                                 | 1,500.00       | 34,200.00         |
| Singapore   | National University of Singapore    | 1,550.00       | 38,500.00         |
| Singapore   | NTU Singapore                       | 1,600.00       | 8,900.00          |

## Analysis and Insights on International Education Costs
1. ### Most Affordable and Expensive Education
- ***Affordable Education:*** Countries like Tunisia, Algeria, and Egypt offer significantly lower education costs for both Bachelor's and Master's programs. For instance, the University of Gabes in Tunisia offers a Master’s program in Computer Engineering with a total cost of around ***$5,500 USD***.

- ***Expensive Education:*** On the other hand, the USA stands out as having some of the highest education costs, with Stanford University’s PhD programs in Computer Science and Physics having total costs upwards of ***$190,000 USD.***

2. ### Popular Programs and Their Costs
- ***Computer Science*** is the most popular program worldwide, with an average tuition cost of ***$26,390***. The program has the highest number of offerings, with 298 instances recorded across various institutions.

- Other popular fields include ***Data Science, Computer Engineering, and Artificial Intelligence,*** each with average tuition costs ranging from $11,200 to $14,250 USD.

3. ### Tuition by Degree Level
- ***Bachelor’s Programs:*** The average tuition per year for Bachelor's programs is $21,454, which is the highest compared to Master's and PhD programs.

- ***PhD Programs:*** Despite their extended duration (typically 5 years), PhD programs have a slightly lower average tuition ($19,316 per year) than Bachelor's programs.

- ***Master’s Programs:*** These programs are generally more affordable, with an average tuition of $16,836 per year.

4. ### Cost Comparison: USA vs Singapore
- ***Studying in the USA*** is significantly more expensive than in Singapore. The average total cost of education in the USA is about $124,171, which is over 40% higher than Singapore’s $88,395.

- ***Tuition in the USA averages $47,742,*** compared to $34,172 in Singapore. However, the rent and additional costs in Singapore are also comparatively lower, contributing to its overall affordability.

5. ### Best Value for Money
- ***Programs in Luxembourg and Germany*** offer the lowest average cost per year, with programs like Computer Science and Digital Innovation in Luxembourg costing as little as ***$133 per year.*** In contrast, popular programs in the USA and other high-cost countries may have a much higher annual cost.

6. ### Average Rent and Tuition in USA and Singapore
- In the USA, universities in cities like New York, San Francisco, and Boston charge ***an average rent of $2,200–$2,500 per month,*** while tuition can reach up to ***$58,933 per year.***

- In Singapore, rents are more affordable, ***ranging from $1,000 to $1,600,*** with ***tuition varying from $34,000 to $39,000 per year.*** This makes Singapore an attractive destination for students looking for a balance between quality education and reasonable living expenses.

### Conclusion
#### The analysis highlights significant regional disparities in education costs. While the USA is among the most expensive destinations for international students, countries like Tunisia, Algeria, and Luxembourg provide more affordable alternatives. For students prioritizing affordability, Singapore stands as a competitive option, offering lower living costs and more reasonable tuition fees compared to the USA.
#