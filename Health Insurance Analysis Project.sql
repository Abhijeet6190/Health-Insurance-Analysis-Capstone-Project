CREATE DATABASE patient;


USE patient;


SELECT*FROM patient.name_details;


SELECT*FROM patient.hospital_details;


SELECT*FROM patient.medical_details;


select n.Customer_ID, n.name, m.BMI, m.HBA1C, m.Heart_Issues, m.Any_Transplants, m.Cancer_history, m.NumberOfMajorSurgeries,
m.smoker, h.children, h.charges, h.Hospital_tier, h.City_tier, h.State_ID, h.Age
from name_details n left join medical_details m
on n.Customer_ID = m.Customer_ID
left join hospital_details h
on n.Customer_ID = h.Customer_ID;


SELECT*FROM patient.merged_details;



select Customer_ID, name, Age
from merged_details
where HBA1C > 6.5 and Heart_Issues = 'Yes';


select AVG(Age) as AverageAge
from merged_details
where HBA1C > 6.5 and Heart_Issues = 'Yes';


select AVG(children) as AverageDependentChildren
from merged_details
where HBA1C > 6.5 and Heart_Issues = 'Yes';


select AVG(BMI) as AverageBMI
from merged_details
where HBA1C > 6.5 and Heart_Issues = 'Yes';


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where HBA1C > 6.5 and Heart_Issues = 'Yes';



select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where Hospital_tier = "tier - 1";


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where Hospital_tier = "tier - 2";


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where Hospital_tier = "tier - 3";


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where City_tier  = "tier - 1";


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where City_tier  = "tier - 2";


select AVG(charges) as Average_Hospitalization_Cost
from merged_details
where City_tier  = "tier - 3";



select count(Customer_ID) as Total_Number_of_People
from merged_details
where Cancer_history = 'Yes' and NumberOfMajorSurgeries between 1 and 3;



select State_ID, count(Hospital_tier) as Count_of_HospitalTier1_in_each_state
from merged_details
where Hospital_tier = "tier - 1"
group by State_ID;