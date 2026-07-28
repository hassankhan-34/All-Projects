Create Database Prescription_chain101;
USE Prescription_chain101;

CREATE TABLE Doctors (
    SSN CHAR(9) PRIMARY KEY,
    Name VARCHAR(25) NOT NULL,
    Specialty VARCHAR(15) NOT NULL,
    Years_Of_Experience INT NOT NULL
);

-- For Safe update
-- For DISABLING THE SAFE MODE , USE THE FOLLOWING
SET SQL_SAFE_UPDATES = 0;
-- -- For ENABLING THE SAFE MODE , USE THE FOLLOWING
SET SQL_SAFE_UPDATES = 1;




Create Table patients(
SSN CHAR(9) PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
Address VARCHAR(80) ,
Age int,
Primary_Physician CHAR(25),
FOREIGN KEY (Primary_Physician) REFERENCES Doctors(SSN)
);



-- Create the Pharmaceutical_Companies table
CREATE TABLE Pharmaceutical_Companies (
    Name VARCHAR(35) PRIMARY KEY,
    Phone VARCHAR(20)
);

-- Create the Drugs table with a foreign key reference to Pharmaceutical_Companies
CREATE TABLE Drugs (
    TradeName VARCHAR(25),
    Formula VARCHAR(80) NOT NULL,
    CompanyName VARCHAR(35),
    PRIMARY KEY (TradeName),
    FOREIGN KEY (CompanyName) REFERENCES Pharmaceutical_Companies(Name)
);

DROP TABLE Pharmacies;

CREATE TABLE Pharmacies (
    Name VARCHAR(25) PRIMARY KEY,
    Address VARCHAR(80) NOT NULL,
    PhoneNumber VARCHAR(25) NOT NULL
);

CREATE TABLE PharmacyDrugs (
    PharmacyName VARCHAR(25),
    TradeName VARCHAR(25),
    CompanyName VARCHAR(35),
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (PharmacyName, TradeName, CompanyName),
    FOREIGN KEY (PharmacyName) REFERENCES Pharmacies(Name),
    FOREIGN KEY (TradeName) REFERENCES Drugs(TradeName),
	FOREIGN KEY (CompanyName) REFERENCES Pharmaceutical_Companies(Name)
);



CREATE TABLE Prescriptions (
	PrescriptionID INT AUTO_INCREMENT PRIMARY KEY,
    PatientSSN CHAR(15),
    Patient_Name varchar(24),
    DoctorSSN CHAR(15),
    Doctor_Name varchar(25),
    TradeName VARCHAR(35),
    CompanyName VARCHAR(35),
    Date_ DATE NOT NULL,
    Quantity INT NOT NULL,
    Symptoms varchar(25),
  --  PRIMARY KEY (PatientSSN, DoctorSSN, TradeName, CompanyName),
    FOREIGN KEY (PatientSSN) REFERENCES Patients(SSN),
    FOREIGN KEY (DoctorSSN) REFERENCES Doctors(SSN),
	FOREIGN KEY (TradeName) REFERENCES Drugs(TradeName),
	FOREIGN KEY (CompanyName) REFERENCES Pharmaceutical_Companies(Name)
);

CREATE TABLE Contracts (
    CompanyName VARCHAR(35),
    PharmacyName VARCHAR(25),
    StartDate DATE NOT NULL,
    EndDate DATE,
    ContractText TEXT NOT NULL,
    SupervisorSSN CHAR(9) NOT NULL,
    -- PRIMARY KEY (CompanyName, PharmacyName, StartDate),
    FOREIGN KEY (CompanyName) REFERENCES Pharmaceutical_Companies(Name),
    FOREIGN KEY (PharmacyName) REFERENCES Pharmacies(Name),
    FOREIGN KEY (SupervisorSSN) REFERENCES Doctors(SSN)
);


INSERT INTO Doctors (SSN, Name, Specialty, Years_Of_Experience) VALUES
('123456789', 'Dr. Ahmed Khan', 'Cardiology', 15),
('234567890', 'Dr. Sana Malik', 'Neurology', 10),
('345678901', 'Dr. Asim Ali', 'Pediatrics', 8),
('456789012', 'Dr. Rabia Shah', 'Orthopedics', 20),
('567890123', 'Dr. Saad Qureshi', 'Dermatology', 12),
('678901234', 'Dr. Ayesha Iqbal', 'Cardiology', 14),
('789012345', 'Dr. Hamza Ahmed', 'Neurology', 9),
('890123456', 'Dr. Zara Khan', 'Pediatrics', 11),
('901234567', 'Dr. Bilal Hussain', 'Orthopedics', 18),
('012345678', 'Dr. Fatima Raza', 'Dermatology', 13),
('112233445', 'Dr. Omar Saeed', 'Cardiology', 16),
('223344556', 'Dr. Maria Khan', 'Neurology', 7),
('334455667', 'Dr. Usman Tariq', 'Pediatrics', 6),
('445566778', 'Dr. Nadia Javed', 'Orthopedics', 21),
('556677889', 'Dr. Ali Raza', 'Dermatology', 19),
('667788990', 'Dr. Nida Hussain', 'Cardiology', 17),
('778899001', 'Dr. Zeeshan Ahmed', 'Neurology', 8),
('889900112', 'Dr. Mehwish Akhtar', 'Pediatrics', 12),
('990011223', 'Dr. Faisal Qureshi', 'Orthopedics', 22),
('100122334', 'Dr. Amina Tariq', 'Dermatology', 14),
('211233445', 'Dr. Kamran Shah', 'Cardiology', 18),
('322344556', 'Dr. Sarah Malik', 'Neurology', 11),
('433455667', 'Dr. Yasir Javed', 'Pediatrics', 9),
('544566778', 'Dr. Anam Raza', 'Orthopedics', 23),
('655677889', 'Dr. Imran Saeed', 'Dermatology', 15);


INSERT INTO Patients (SSN, Name, Address, Age, Primary_Physician) VALUES
('101010101', 'Amina Aziz', 'House #123, Block A, Karachi', 30, '123456789'),
('202020202', 'Hassan Tariq', 'House #456, Block B, Lahore', 45, '234567890'),
('303030303', 'Sara Qureshi', 'House #789, Block C, Islamabad', 50, '345678901'),
('404040404', 'Zainab Malik', 'House #101, Block D, Peshawar', 35, '456789012'),
('505050505', 'Ali Shah', 'House #102, Block E, Quetta', 28, '567890123'),
('606060606', 'Fatima Ahmed', 'House #103, Block F, Multan', 40, '678901234'),
('707070707', 'Bilal Khan', 'House #104, Block G, Faisalabad', 32, '789012345'),
('808080808', 'Mariam Hassan', 'House #105, Block H, Rawalpindi', 29, '890123456'),
('909090909', 'Usman Raza', 'House #106, Block I, Hyderabad', 27, '901234567'),
('111111222', 'Noor Fatima', 'House #107, Block J, Sialkot', 36, '012345678'),
('222222333', 'Zara Ali', 'House #108, Block K, Gujranwala', 44, '112233445'),
('333333444', 'Yasir Javed', 'House #109, Block L, Abbottabad', 39, '223344556'),
('444444555', 'Anum Tariq', 'House #110, Block M, Sargodha', 42, '334455667'),
('555555666', 'Raza Khan', 'House #111, Block N, Sukkur', 31, '445566778'),
('666666777', 'Hina Malik', 'House #112, Block O, Bahawalpur', 33, '556677889'),
('777777888', 'Junaid Shah', 'House #113, Block P, Karachi', 38, '667788990'),
('888888999', 'Sana Raza', 'House #114, Block Q, Lahore', 26, '778899001'),
('999999000', 'Ali Akbar', 'House #115, Block R, Islamabad', 34, '889900112'),
('111222333', 'Ayesha Khan', 'House #116, Block S, Peshawar', 41, '990011223'),
('222333444', 'Hamza Iqbal', 'House #117, Block T, Quetta', 37, '100122334'),
('333444555', 'Asad Ahmed', 'House #118, Block U, Multan', 25, '211233445'),
('444555666', 'Rabia Hussain', 'House #119, Block V, Faisalabad', 32, '322344556'),
('555666777', 'Faisal Malik', 'House #120, Block W, Rawalpindi', 35, '433455667'),
('666777888', 'Anila Tariq', 'House #121, Block X, Hyderabad', 28, '544566778'),
('777888999', 'Umer Ali', 'House #122, Block Y, Sialkot', 30, '655677889');


INSERT INTO Pharmaceutical_Companies (Name, Phone) VALUES
('Getz Pharma', '021-1234567'),
('GlaxoSmithKline Pakistan', '021-2345678'),
('The Searle Company', '021-3456789'),
('Hilton Pharma', '021-4567890'),
('Highnoon Laboratories', '021-5678901'),
('Martin Dow', '021-6789012'),
('Indus Pharma', '021-7890123'),
('Ferozsons Laboratories', '021-8901234'),
('Abbott Laboratories Pakistan', '021-9012345'),
('Bayer Pakistan', '021-0123456'),
('Pfizer Pakistan', '021-1234500'),
('Sanofi Pakistan', '021-2345600'),
('Novartis Pakistan', '021-3456700'),
('Merck Pakistan', '021-4567800'),
('Brooks Pharma', '021-5678900'),
('PharmaGuide Pakistan', '021-6789000'),
('Atco Laboratories', '021-7890000'),
('Samson Pharmaceuticals', '021-8900000'),
('Amson Vaccines & Pharma', '021-9000000'),
('AGP Limited', '021-0000000'),
('Medisure Laboratories', '021-1111111'),
('Barrett Hodgson Pakistan', '021-2222222'),
('Himont Pharmaceuticals', '021-3333333'),
('CCL Pharmaceuticals', '021-4444444'),
('SAMI Pharmaceuticals', '021-5555555');

show 
INSERT INTO Pharmacies (Name, Address, PhoneNumber) VALUES
('ABC Pharmacy', '123 Main Street, Karachi', '021-1234567'),
('XYZ Pharmacy', '456 Central Avenue, Lahore', '042-2345678'),
('Pharma Plus', '789 Park Road, Islamabad', '051-3456789'),
('City Pharmacy', '321 Baker Street, Rawalpindi', '051-4567890'),
('MediCare Pharmacy', '567 Elm Avenue, Faisalabad', '041-5678901'),
('Wellness Pharmacy', '890 Maple Drive, Lahore', '042-6789012'),
('Good Health Pharmacy', '234 Pine Street, Karachi', '021-7890123'),
('Green Pharmacy', '567 Oak Lane, Islamabad', '051-8901234'),
('Care Pharmacy', '901 Willow Road, Lahore', '042-9012345'),
('Life Pharmacy', '123 Cedar Avenue, Karachi', '021-0123456'),
('Family Pharmacy', '456 Pine Street, Islamabad', '051-1234500'),
('Global Pharmacy', '789 Elm Avenue, Rawalpindi', '051-2345600'),
('Prime Pharmacy', '321 Oak Lane, Lahore', '042-3456700'),
('Pulse Pharmacy', '567 Maple Drive, Karachi', '021-4567800'),
('Carewell Pharmacy', '890 Cedar Avenue, Islamabad', '051-5678900'),
('Health First Pharmacy', '234 Willow Road, Lahore', '042-6789000'),
('Trust Pharmacy', '567 Pine Street, Rawalpindi', '051-7890000'),
('Well Pharmacy', '901 Elm Avenue, Karachi', '021-8900000'),
('Relief Pharmacy', '123 Oak Lane, Islamabad', '051-9000000'),
('Healthy Living Pharmacy', '456 Maple Drive, Lahore', '042-0000000'),
('Sunrise Pharmacy', '789 Willow Road, Karachi', '021-1111111'),
('Sun Pharmacy', '321 Cedar Avenue, Islamabad', '051-2222222'),
('Elite Pharmacy', '567 Pine Street, Rawalpindi', '051-3333333'),
('Unity Pharmacy', '901 Oak Lane, Lahore', '042-4444444'),
('Wellbeing Pharmacy', '123 Maple Drive, Karachi', '021-5555555');


INSERT INTO Drugs (TradeName, Formula, CompanyName) VALUES
('Panadol', 'C8H9NO2', 'GlaxoSmithKline Pakistan'),
('Disprin', 'C9H8O4', 'Bayer Pakistan'),
('Augmentin', 'C16H19N3O5S', 'GlaxoSmithKline Pakistan'),
('Flagyl', 'C6H9N3O3', 'Sanofi Pakistan'),
('Ventolin', 'C13H21NO4', 'GlaxoSmithKline Pakistan'),
('Zentel', 'C12H15N3O2S', 'GlaxoSmithKline Pakistan'),
('Gravinate', 'C18H21NO3', 'The Searle Company'),
('Neurobion', 'C15H23N5O3', 'Merck Pakistan'),
('Mosegor', 'C19H25NO', 'Novartis Pakistan'),
('Clobevate', 'C22H26ClFO4', 'Brooks Pharma'),
('Risek', 'C17H19N3O3S', 'Getz Pharma'),
('Amoxil', 'C16H19N3O5S', 'Highnoon Laboratories'),
('Cefspan', 'C15H14N6O4S2', 'GlaxoSmithKline Pakistan'),
('Paracil', 'C8H9NO2', 'PharmaGuide Pakistan'),
('Sitaglu', 'C16H15F6N5O', 'Martin Dow'),
('Brufen', 'C15H11BrO2', 'Abbott Laboratories Pakistan'),
('Soframycin', 'C22H30N2O10', 'Abbott Laboratories Pakistan'),
('Zovirax', 'C8H11N5O3', 'GlaxoSmithKline Pakistan'),
('Duphaston', 'C21H28O2', 'Abbott Laboratories Pakistan'),
('Vermox', 'C16H13N3O2S', 'GlaxoSmithKline Pakistan'),
('Dioralyte', 'NaCl, KCl, NaHCO3, Glucose', 'Sanofi Pakistan'),
('Zinnat', 'C15H17N3O6S2', 'GlaxoSmithKline Pakistan'),
('Atarax', 'C21H26ClN3O3', 'Abbott Laboratories Pakistan'),
('Zyloric', 'C5H4N4O', 'GlaxoSmithKline Pakistan');


-- ALTER TABLE Pharmaceutial_Companies MODIFY COLUMN Name VARCHAR(500);

INSERT INTO Prescriptions (PatientSSN, Patient_Name, DoctorSSN, Doctor_Name, TradeName, CompanyName, Date_, Quantity, Diagnosis)
VALUES	
('101010101', 'Amina Aziz', '123456789', 'Dr. Ahmed Khan', 'Panadol', 'GlaxoSmithKline Pakistan', '2024-07-04', 1, 'Headache Fever'),
('202020202', 'Hassan Tariq', '234567890', 'Dr. Sana Malik', 'Disprin', 'Bayer Pakistan', '2024-07-04', 2, 'Body Pain'),
('303030303', 'Sara Qureshi', '345678901', 'Dr. Asim Ali', 'Augmentin', 'GlaxoSmithKline Pakistan', '2024-07-04', 1, 'Fever, Throat Infection'),
('404040404', 'Zainab Malik', '456789012', 'Dr. Rabia Shah', 'Flagyl', 'Sanofi Pakistan', '2024-07-04', 1, 'Stomach Infection'),
('505050505', 'Ali Shah', '567890123', 'Dr. Saad Qureshi', 'Ventolin', 'GlaxoSmithKline Pakistan', '2024-07-04', 1, 'Asthma'),
('606060606', 'Fatima Ahmed', '678901234', 'Dr. Ayesha Iqbal', 'Zentel', 'GlaxoSmithKline Pakistan', '2024-07-04', 1, 'Intestinal Worms'),
('707070707', 'Bilal Khan', '789012345', 'Dr. Hamza Ahmed', 'Gravinate', 'The Searle Company', '2024-07-04', 1, 'Nausea, Vomiting'),
('808080808', 'Mariam Hassan', '890123456', 'Dr. Zara Khan', 'Neurobion', 'Merck Pakistan', '2024-07-04', 1, 'Vitamin Deficiency'),
('909090909', 'Usman Raza', '901234567', 'Dr. Bilal Hussain', 'Mosegor', 'Novartis Pakistan', '2024-07-04', 1, 'Appetite Stimulant'),
('111111222', 'Noor Fatima', '012345678', 'Dr. Fatima Raza', 'Clobevate', 'Brooks Pharma', '2024-07-04', 1, 'Skin Allergy'),
('222222333', 'Zara Ali', '112233445', 'Dr. Omar Saeed', 'Risek', 'Getz Pharma', '2024-07-04', 1, 'Acid Reflux');

SHOW COLUMNS FROM Prescriptions;
INSERT INTO Prescriptions (PatientSSN, Patient_Name, DoctorSSN, Doctor_Name, TradeName, CompanyName, Date_, Quantity, Diagnosis)
VALUES	
('333333444', 'Yasir Javed', '223344556', 'Dr. Maria Khan', 'Amoxil', 'Highnoon Laboratories', '2024-07-04', 1, 'Bacterial Infection'),
('444444555', 'Anum Tariq', '334455667', 'Dr. Usman Tariq', 'Cefspan', 'GlaxoSmithKline Pakistan', '2024-07-04', 1, 'Respiratory Infection'),
('555555666', 'Raza Khan', '445566778', 'Dr. Nadia Javed', 'Paracil', 'PharmaGuide Pakistan', '2024-07-04', 1, 'Pain, Fever');


INSERT INTO PharmacyDrugs (PharmacyName, TradeName, CompanyName, Price) VALUES
('ABC Pharmacy', 'Panadol', 'GlaxoSmithKline Pakistan', 10.50),
('XYZ Pharmacy', 'Disprin', 'Bayer Pakistan', 8.75),
('Pharma Plus', 'Augmentin', 'GlaxoSmithKline Pakistan', 15.25),
('City Pharmacy', 'Flagyl', 'Sanofi Pakistan', 12.00),
('MediCare Pharmacy', 'Ventolin', 'GlaxoSmithKline Pakistan', 18.50),
('Wellness Pharmacy', 'Zentel', 'GlaxoSmithKline Pakistan', 14.75),
('Good Health Pharmacy', 'Gravinate', 'The Searle Company', 11.20),
('Green Pharmacy', 'Neurobion', 'Merck Pakistan', 9.80),
('Care Pharmacy', 'Mosegor', 'Novartis Pakistan', 13.50),
('Life Pharmacy', 'Clobevate', 'Brooks Pharma', 7.90),
('Family Pharmacy', 'Risek', 'Getz Pharma', 16.00),
('Global Pharmacy', 'Amoxil', 'Highnoon Laboratories', 14.00),
('Prime Pharmacy', 'Cefspan', 'GlaxoSmithKline Pakistan', 17.50),
('Pulse Pharmacy', 'Paracil', 'PharmaGuide Pakistan', 10.80),
('Carewell Pharmacy', 'Sitaglu', 'Martin Dow', 19.75),
('Health First Pharmacy', 'Brufen', 'Abbott Laboratories Pakistan', 12.60),
('Trust Pharmacy', 'Soframycin', 'Abbott Laboratories Pakistan', 15.30),  
('Well Pharmacy', 'Zovirax', 'GlaxoSmithKline Pakistan', 11.90),
('Relief Pharmacy', 'Duphaston', 'Abbott Laboratories Pakistan', 18.20),
('Healthy Living Pharmacy', 'Vermox', 'GlaxoSmithKline Pakistan', 13.70),
('Sunrise Pharmacy', 'Dioralyte', 'Sanofi Pakistan', 9.50),
('Sun Pharmacy', 'Brufen', 'Abbott Laboratories Pakistan', 12.60),
('Elite Pharmacy', 'Zinnat', 'GlaxoSmithKline Pakistan', 16.80),
('Unity Pharmacy', 'Atarax', 'Abbott Laboratories Pakistan', 14.90), 
('Wellbeing Pharmacy', 'Zyloric', 'GlaxoSmithKline Pakistan', 17.20);


-- GlaxoSmithKline Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('GlaxoSmithKline Pakistan', 'ABC Pharmacy', '2024-07-01', '2025-06-30', 'Supply of various pharmaceutical products', '123456789');

-- The Searle Company
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('The Searle Company', 'XYZ Pharmacy', '2024-07-01', '2025-06-30', 'Exclusive distribution rights for specific medications', '234567890');

-- Martin Dow
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Martin Dow', 'Pharma Plus', '2024-07-01', '2025-06-30', 'Marketing and sales support for new drug launches', '345678901');

-- Sanofi Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Sanofi Pakistan', 'City Pharmacy', '2024-07-01', '2025-06-30', 'Supply of vaccines and healthcare products', '456789012');

-- Highnoon Laboratories
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Highnoon Laboratories', 'MediCare Pharmacy', '2024-07-01', '2025-06-30', 'Distribution of generic pharmaceuticals', '567890123');

-- Novartis Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Novartis Pakistan', 'Wellness Pharmacy', '2024-07-01', '2025-06-30', 'Marketing collaboration on chronic disease management', '678901234');

-- Brooks Pharma
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Brooks Pharma', 'Good Health Pharmacy', '2024-07-01', '2025-06-30', 'Exclusive distribution rights for dermatological products', '789012345');

-- PharmaGuide Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('PharmaGuide Pakistan', 'Green Pharmacy', '2024-07-01', '2025-06-30', 'Supply of over-the-counter medications', '890123456');

-- Abbott Laboratories Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Abbott Laboratories Pakistan', 'Care Pharmacy', '2024-07-01', '2025-06-30', 'Distribution of nutritional supplements', '901234567');

-- Bayer Pakistan
INSERT INTO Contracts (CompanyName, PharmacyName, StartDate, EndDate, ContractText, SupervisorSSN)
VALUES ('Bayer Pakistan', 'Life Pharmacy', '2024-07-01', '2025-06-30', 'Marketing and distribution support for cardiology drugs', '012345678');

Select * from Contracts;

-- DML TESTING 
DELETE FROM Doctors 
WHERE Years_Of_Experience < '4';

-- Sorting 
Select * From Doctors
Order By Name Asc;


DELETE FROM Doctors 
WHERE Years_Of_Experience < '11';


DELETE FROM Prescriptions
WHERE DoctorSSN IN (
    SELECT SSN
    FROM Doctors
    WHERE Years_Of_Experience < 11
);

DELETE FROM Patients
WHERE Primary_Physician IN (
    SELECT SSN
    FROM Doctors
    WHERE Years_Of_Experience < 11
);
DELETE FROM Contracts
WHERE SupervisorSSN IN (
    SELECT SSN
    FROM Doctors
    WHERE Years_Of_Experience < 11
);

DELETE FROM Doctors
WHERE Years_Of_Experience < 11;

select * from Doctors;




SHOW CREATE TABLE Patients;

Alter table Doctors
Rename Column Name to Name_of_Doctors;

Alter table Doctors
Rename Column Name_of_Doctors to Name;

select * from Doctors;

ALTER TABLE Doctors
Modify COLUMN age Varchar(10);

SHOW COLUMNS FROM Doctors;



DELETE FROM Prescriptions
WHERE PatientSSN IN (
    SELECT SSN
    FROM Patients
);

DELETE FROM Patients
WHERE Primary_Physician IN (
    SELECT SSN
    FROM Doctors
);
DELETE FROM Contracts
WHERE SupervisorSSN IN (
    SELECT SSN
    FROM Doctors
);
ALTER TABLE Contracts
DROP FOREIGN KEY contracts_ibfk_3;
ALTER TABLE Patients
DROP FOREIGN KEY patients_ibfk_1;

ALTER TABLE Prescriptions
DROP FOREIGN KEY prescriptions_ibfk_2;

DROP TABLE Doctors;

SELECT * FROM PharmacyDrugs;

DELETE FROM PharmacyDrugs 
WHERE PharmacyName = 'Wellness Pharmacy' AND TradeName = 'Zentel';

SELECT * FROM Prescriptions;

UPDATE Prescriptions
SET Quantity = 2
WHERE PatientSSN = '505050505' AND DoctorSSN = '567890123' AND TradeName = 'Ventolin';


DELETE FROM Prescriptions 
WHERE PrescriptionID = 2;


SELECT * FROM Contracts;

UPDATE Contracts
SET EndDate = DATE_ADD(EndDate, INTERVAL 1 YEAR)
WHERE CompanyName = 'GlaxoSmithKline Pakistan' AND PharmacyName = 'ABC Pharmacy';


UPDATE Contracts 
SET EndDate = '2026-06-30' 
WHERE CompanyName = 'GlaxoSmithKline Pakistan' AND PharmacyName = 'ABC Pharmacy';




UPDATE Prescriptions 
SET Quantity = 1 
WHERE PrescriptionID = 1;


TRUNCATE TABLE Prescriptions;

ALTER TABLE Prescriptions 
RENAME COLUMN Symptoms TO Diagnosis;



UPDATE PharmacyDrugs 
SET Price = 18.00 
WHERE PharmacyName = 'ABC Pharmacy' AND TradeName = 'Panadol';


show tables;


Truncate Table Doctors;
SELECT * FROM Doctors;

SELECT * FROM DRUGS;
WHERE Formula = 'C8H9NO2';

SELECT * FROM Drugs 
ORDER BY Formula ASC;

SELECT COUNT(Distinct Formula) 
FROM Drugs;

DELETE FROM Pharmacies
WHERE Name = 'Wellness Pharmacy';

SELECT * FROM pharmacies;

SELECT * FROM pharmacydrugs; 

ALTER TABLE PharmacyDrugs 
RENAME COLUMN Price TO DrugPrice;

DROP TABLE PharmacyDrugs;

show tables;
TRUNCATE TABLE PharmacyDrugs;

UPDATE Drugs 
SET TradeName = 'Cefiget'
WHERE Formula = 'C8H9NO2' AND TradeName = 'Panadol';

UPDATE Drugs 
SET TradeName = 'Cefaloget'
WHERE Formula = 'C8H9NO2' AND TradeName = 'Paracil';



SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE patients;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Patients;
Truncate Table Patients;

Select COUNT(*)
FROM Patients;

Select COUNT(DISTINCT Address) FROM Patients;

Select * From Patients
WHERE Address = 'House #101, Block D, Peshawar' or 'House #789, Block C, Islamabad';


Update Patients 
Set Address = 'House #101, Block D, Peshawar'
Where SSN = 101010101;


Update Doctors 
Set Specialty = 'Orthopedics'
Where SSN = 123456789;
SELECT * FROM Doctors;

Select COUNT(DISTINCT Specialty) FROM Doctors;

Select COUNT(*)
FROM Doctors;

SELECT * FROM Doctors
WHERE Specialty = 'Orthopedics' OR Specialty = 'Cardiology';







DELETE FROM Patients 
WHERE Age <= '40';

SELECT * FROM PATIENTS;

Alter table Patients
Rename Column Name to Name_of_Patients;



SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'patients';

ALTER TABLE prescriptions
DROP FOREIGN KEY prescriptions_ibfk_1;
Drop Table Patients;

SHOW TABLES;






Update Patients 
Set Address = ‘House #101, Block D, Peshawar’
Where SSN = 101010101;










Alter Table Doctors
Add Age int;


Alter Table Doctors
Drop Column Specialty;
;
SHOW COLUMNS FROM Doctors;
-- Query
Select Avg(Price) From PharmacyDrugs;
-- Subquery "output of another query output"
Select * From PharmacyDrugs
Where Price > (Select Avg(Price) From PharmacyDrugs);


ALTER TABLE patients
RENAME COLUMN Age to Age_Of_Patients;

CREATE TABLE Pharmaceutial_Companies(
Name varchar(35) not null,
PhoneNumber varchar(40) not null,
PRIMARY KEY (Name)
);



-- joins
    
SELECT
    PharmacyDrugs.PharmacyName,
    Drugs.TradeName,
    Drugs.CompanyName,
    Pharmacies.Address,
    Pharmacies.PhoneNumber
FROM
    PharmacyDrugs
RIGHT JOIN Drugs ON PharmacyDrugs.TradeName = Drugs.TradeName
RIGHT JOIN Pharmacies ON PharmacyDrugs.PharmacyName = Pharmacies.Name;

SELECT
    Patients.Name AS PatientName,
    Patients.Address,
    Prescriptions.PrescriptionID,
    Prescriptions.TradeName,
    Prescriptions.Quantity,
    Prescriptions.Date_,
    Prescriptions.Diagnosis
FROM
    Patients
LEFT JOIN Prescriptions ON Patients.SSN = Prescriptions.PatientSSN;

SELECT
    Doctors.SSN AS DoctorSSN,
    Doctors.Name AS DoctorName,
    Prescriptions.PrescriptionID,
    Prescriptions.Patient_Name,
    Prescriptions.TradeName,
    Prescriptions.Quantity,
    Prescriptions.Date_,
    Prescriptions.Diagnosis
FROM
    Doctors
LEFT JOIN Prescriptions ON Doctors.SSN = Prescriptions.DoctorSSN
UNION
SELECT
    Doctors.SSN AS DoctorSSN,
    Doctors.Name AS DoctorName,
    Prescriptions.PrescriptionID,
    Prescriptions.Patient_Name,
    Prescriptions.TradeName,
    Prescriptions.Quantity,
    Prescriptions.Date_,
    Prescriptions.Diagnosis
FROM
    Doctors
RIGHT JOIN Prescriptions ON Doctors.SSN = Prescriptions.DoctorSSN;CREATE TABLE PharmacyDrugs (     PharmacyName VARCHAR(25),     TradeName VARCHAR(25),     CompanyName VARCHAR(35),     Price DECIMAL(10, 2) NOT NULL,     PRIMARY KEY (PharmacyName, TradeName, CompanyName),     FOREIGN KEY (PharmacyName) REFERENCES Pharmacies(Name),     FOREIGN KEY (TradeName) REFERENCES Drugs(TradeName),  FOREIGN KEY (CompanyName) REFERENCES Pharmaceutial_Companies(Name) )