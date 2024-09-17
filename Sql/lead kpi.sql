use CRM;

-- Total lead
SELECT count(`Lead ID`) as total_leads FROM leads ;

-- Expected Amount from Converted Leads

SELECT SUM(CAST(REPLACE(REPLACE(o.`Expected Amount`, ',', ''), '$', '') AS DECIMAL(20, 2))) AS Total_Expected_Amount_Converted_Leads
FROM opportuninty o
Right JOIN 
    Leads l ON o.`Opportunity ID` = l.`Converted Opportunity ID`
WHERE 
    l.`Converted` = 'True';
    
-- Conversion Rate
SELECT 
    (SUM(CASE WHEN Converted1 = '1' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Conversion_Rate_Percentage
FROM leads;

-- Converted Accounts

SELECT COUNT(*) AS Converted_Accounts
FROM leads
WHERE Converted1 = 1;

--  Converted Opportunities
SELECT 
    (SUM(CASE WHEN `# Converted Opportunities` = '1' THEN 1 ELSE 0 END))as Converted_Accounts
FROM leads;



-- Lead By Source
SELECT Lead_Source, COUNT('Total Leads') AS Lead_Count
FROM leads
GROUP BY Lead_Source;

SELECT 'Lead Source'  FROM leads;
-- where 'Lead Source';
-- change name 
ALTER TABLE leads 
CHANGE `Lead Source` Lead_Source TEXT;




--  Lead By industry
SELECT Industry, COUNT('Total Leads') AS Lead_Count
FROM leads
GROUP BY Industry
order by Lead_Count DESC;


SELECT
    SUM(`Expected Amount`) AS Total_Expected_Amount_Converted_Leads
FROM 
    opportuninty;