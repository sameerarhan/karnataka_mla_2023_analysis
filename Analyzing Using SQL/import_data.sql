                                            # ONE WAY TO IMPORT THE DATA TO MySQL DATABASE 
## Data Loading (Using MySQL Workbench Import Wizard)

Follow these steps to load the dataset into MySQL:

### Step 1: Open MySQL Workbench
- Connect to your MySQL server

### Step 2: Select Database
- Choose your schema (database) where the table `mla_list` is created

### Step 3: Open Table Data Import Wizard
- Go to **Server → Data Import**
  OR
- Right-click on the schema → **Table Data Import Wizard**

### Step 4: Select CSV File
- Browse and select your dataset file:
  `mla_data.csv`

### Step 5: Configure Import
- Choose **Existing Table**
- Select: `mla_list`

### Step 6: Map Columns
Ensure correct mapping:

- Candidate_id → INT  
- Candidate → TEXT/VARCHAR  
- Constituency → TEXT  
- Party → TEXT  
- Age → INT  
- Gender → ENUM ('MALE','FEMALE')  
- Criminal_Cases → INT  
- Serious_Criminal_Cases → ENUM ('Yes','No')  
- Education → TEXT  
- Total_Assets → DECIMAL  
- Liabilities → DECIMAL  
- Category → ENUM ('GENERAL','SC','ST')  

### Step 7: Execute Import
- Click **Next → Next → Finish**

### Step 8: Verify Data
Run:
```sql
SELECT * FROM mla_list LIMIT 10;



                                            # SECOND WAY TO IMPORT THE DATA TO MySQL DATABASE 
USE karnataka_cabinet      -- karnataka_cabinet is database name 
LOAD DATA INFILE 'path_to_csv/mla_data.csv'
INTO TABLE mla_list
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
