
/*A1*/
SELECT sum(case when CLaimNb > 0 then 1 else 0 end) as total_claimed,count(IDpol) as total_customer,sum(case when CLaimNb > 0 then 1 else 0 end)/count(IDpol) as per_claimed FROM auto_insurance_risk;

/*A2.1*/
/*ALTER TABLE auto_insurance_risk ADD claim_flag integer;*/

/*A2.2*/
UPDATE auto_insurance_risk
SET claim_flag = case when CLaimNb > 0 then 1 else 0 end;

/*A3.1*/
SELECT avg(Exposure) FROM Auto_insurance_risk WHERE ClaimNb > 0;

/*A4.1*/
SELECT
case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end as exposure_bkt,sum(ClaimNb) as num_claims,count(IDpol) as num_pol,((sum(ClaimNb)*100.0)/count(IDpol)) as pct_claim FROM auto_insurance_risk
GROUP BY case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end;
	
/*A5*/
SELECT Area,avg(ClaimNb) as avgerage_claims FROM auto_insurance_risk GROUP BY Area;

/*A6*/
SELECT Area,case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end as exposure_bkt,sum(ClaimNb) as num_claims,count(IDpol) as num_pol,((sum(ClaimNb)*100.0)/count(IDpol)) as pct_claim FROM auto_insurance_risk
GROUP BY Area,case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end
ORDER BY ((sum(ClaimNb)*100.0)/count(IDpol)) DESC;

/*A7.1*/
SELECT avg(VehAge) FROM Auto_insurance_risk WHERE ClaimNb > 0 UNION SELECT avg(VehAge) FROM Auto_insurance_risk WHERE ClaimNb = 0 ;

/*A7.2*/
SELECT avg(VehAge), Area FROM Auto_insurance_risk WHERE ClaimNb > 0 GROUP BY Area ; 

/*A8*/
SELECT case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end as exposure_bkt,claim_flag,avg(VehAge) FROM auto_insurance_risk GROUP BY case when exposure <= 0.25 then 'E1' 
when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4' end,claim_flag;

/*A9.1*/
SELECT case when ClaimNb = 0 then 'No Claims' when ClaimNb = 1 then '1 Claim' when ClaimNb > 1 then 'MT 1 Claims' end as Claim_Ct,avg(BonusMalus) FROM   auto_insurance_risk
GROUP BY case when ClaimNb = 0 then 'No Claims' when ClaimNb = 1 then '1 Claim' when ClaimNb > 1 then 'MT 1 Claims' end;

/*A10*/
SELECT case when ClaimNb = 0 then 'No Claims' when ClaimNb = 1 then '1 Claim' when ClaimNb > 1 then 'MT 1 Claims'
end as Claim_Ct,avg(Density) FROM auto_insurance_risk GROUP BY case when ClaimNb = 0 then 'No Claims' 
when ClaimNb = 1 then '1 Claim' when ClaimNb > 1 then 'MT 1 Claims'
end;

/*A11*/
SELECT VehGas,VehBrand,(avg(ClaimNb)*100.0)FROM auto_insurance_risk GROUP BY VehGas,VehBrand ORDER BY (avg(ClaimNb)*100.0) DESC Limit 1;

/*A12*/
SELECT case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end as exposure_bkt,Region,sum(claim_flag) as claim_cnt,count(IDPol) as policy_cnt,((sum(claim_flag)*100.0)/count(IDPol)) as claim_rate FROM auto_insurance_risk
GROUP BY case when exposure <= 0.25 then 'E1' when exposure <= 0.50 then 'E2' when exposure <= 0.75 then 'E3' else 'E4'
end,Region ORDER BY ((sum(claim_flag)*100.0)/count(IDPol)) DESC Limit 5;

/*A13*/
SELECT case when DrivAge = 18 then '1-Beginner' when DrivAge <= 30 then '2-Junior' when DrivAge <= 45 then '3-Middle Age' 
when DrivAge <= 60 then '4-Mid-Senior' else '5-Senior' end as age_group,avg(BonusMalus) as avg_bonusmalus 
FROM auto_insurance_risk GROUP BY case when DrivAge = 18 then '1-Beginner' when DrivAge <= 30 then '2-Junior' when DrivAge <= 45 then '3-Middle Age' 
when DrivAge <= 60 then '4-Mid-Senior' else '5-Senior'
end;







