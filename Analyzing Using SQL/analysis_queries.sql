-- ---------------------------------------------------------------
-- Karnataka MLA Analysis - SQL Queries
-- ---------------------------------------------------------------

-- 1. SC/ST Candidates and their Constituency
SELECT Candidate, Constituency
FROM mla_list
WHERE Constituency LIKE '%(SC)%' OR Constituency LIKE '%(ST)%';


-- 2. Number of Seats per Category
SELECT Category, COUNT(*) AS No_of_Seats
FROM mla_list
GROUP BY Category;


-- 3. Average Net Worth of MLA by Party
SELECT Party,
       ROUND(AVG(Total_Assets), 2) AS Avg_Net_Worth
FROM mla_list
GROUP BY Party
ORDER BY Avg_Net_Worth DESC;


-- 4. Average Criminal Cases by Party
SELECT Party,
       ROUND(AVG(Criminal_Cases), 2) AS Avg_Cases
FROM mla_list
GROUP BY Party;


-- 5. Top 3 Richest MLAs per Party
WITH Ranked_MLAs AS (
    SELECT *,
           RANK() OVER (PARTITION BY Party ORDER BY Total_Assets DESC) AS rnk
    FROM mla_list
)
SELECT Candidate, Party, Total_Assets
FROM Ranked_MLAs
WHERE rnk <= 3
ORDER BY Party;


-- 6. Average Age by Party
SELECT Party,
       ROUND(AVG(Age), 0) AS Avg_Age
FROM mla_list
GROUP BY Party
ORDER BY Avg_Age;


-- 7. Gender Distribution per Party
SELECT Party,
       SUM(CASE WHEN Gender = 'MALE' THEN 1 ELSE 0 END) AS Male_Count,
       SUM(CASE WHEN Gender = 'FEMALE' THEN 1 ELSE 0 END) AS Female_Count
FROM mla_list
GROUP BY Party;


-- 8. % of Seats Won by Each Party
SELECT Party,
       CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM mla_list), 2), '%') AS Seat_Percentage
FROM mla_list
GROUP BY Party;


-- 9. Seats Won by Each Party
SELECT Party,
       COUNT(*) AS Seats_Won
FROM mla_list
GROUP BY Party;


-- 10. Women Representation per Party
SELECT Party,
       CONCAT(
           ROUND(
               SUM(CASE WHEN Gender = 'FEMALE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
               2
           ), '%'
       ) AS Female_Percentage
FROM mla_list
GROUP BY Party;


-- 11. Criminal Cases by Candidate
SELECT Constituency,
       Candidate,
       SUM(Criminal_Cases) AS Total_Criminal_Cases
FROM mla_list
GROUP BY Constituency, Candidate
ORDER BY Total_Criminal_Cases DESC;


-- 12. Criminal Cases by Education
SELECT Education,
       SUM(Criminal_Cases) AS Total_Cases
FROM mla_list
GROUP BY Education
ORDER BY Total_Cases DESC;


-- 13. Party-wise MLAs with Serious Criminal Cases
SELECT Party,
       COUNT(*) AS MLAs_With_Serious_Cases
FROM mla_list
WHERE Serious_Criminal_Cases = 'Yes'
GROUP BY Party;


-- 14. Wealth Distribution by Age Group
SELECT 
    CASE 
        WHEN Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 69 THEN '50-69'
        WHEN Age >= 70 THEN '70+'
        ELSE 'Unknown'
    END AS Age_Group,
    COUNT(*) AS Total_MLAs,
    SUM(Total_Assets) AS Total_Wealth,
    AVG(Total_Assets) AS Avg_Wealth
FROM mla_list
GROUP BY Age_Group
ORDER BY Age_Group;


-- 15. Count of MLAs aged 50–70
SELECT COUNT(*) AS Count_50_70
FROM mla_list
WHERE Age BETWEEN 50 AND 70;
