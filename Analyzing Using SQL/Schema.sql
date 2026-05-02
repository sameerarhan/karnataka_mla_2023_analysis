CREATE DATABASE karnataka_cabinet;

USE karnataka_cabinet;

CREATE TABLE mla_list (
    Candidate_id INT PRIMARY KEY,
    Candidate VARCHAR(255),
    Constituency VARCHAR(255),
    Party VARCHAR(100),
    Age INT,
    Gender ENUM('MALE','FEMALE'),
    Criminal_Cases INT,
    Serious_Criminal_Cases ENUM('Yes','No'),
    Education VARCHAR(100),
    Total_Assets DECIMAL(18,2),
    Liabilities DECIMAL(18,2),
    Category ENUM('GENERAL','SC','ST')
);


