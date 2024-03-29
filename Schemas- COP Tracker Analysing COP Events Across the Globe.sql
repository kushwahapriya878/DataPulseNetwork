--Schemas of COP Tracker COP Tracker: Analysing COP Events Across the Globe--

create database COPTracker;
use COPTracker;

-- Define Regions
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(255)
);

--- Insert data into Regions table
INSERT INTO Regions (RegionID, RegionName) VALUES
(1, 'Europe and USA'),
(2, 'Middle East'),
(3, 'Asia'),
(4, 'Africa'),
(5, 'Latin America'),
(6, 'Others');

---Define Countries
create table Countries(
CountryID int primary key,
CountryName varchar(255),
RegionID int
);

---Insert data into Countries table
INSERT INTO Countries (CountryID, CountryName, RegionID) VALUES
(1, 'United Kingdom', 1),
(2, 'France', 1),
(3, 'Germany', 1),
(4, 'Italy', 1),
(5, 'Netherlands', 1),
(6, 'Qatar', 2),
(7, 'Turkey', 2),
(8, 'Egypt', 2),
(9, 'United Arab Emirates', 2),
(10, 'India', 3),
(11, 'Pakistan', 3),
(12, 'Indonesia', 3),
(13, 'Japan', 3),
(14, 'Vietnam', 3),
(15, 'Senegal', 4),
(16, 'South Africa', 4),
(17, 'Nigeria', 4),
(18, 'Kenya', 4),
(19, 'Brazil', 5),
(20, 'Colombia', 5),
(21, 'Mexico', 5),
(22, 'United Nations', 6),
(23, 'International Atomic Energy Agency', 6),
(24, 'World Meteorological Organization', 6),
(25, 'WHO', 6),
(26, 'Microsoft', 6);

-- Define Leaders
CREATE TABLE Leaders (
    LeaderID INT PRIMARY KEY,
    LeaderName VARCHAR(255),
    Title VARCHAR(255),
    CountryID INT
);

-- Insert data into Leaders table
INSERT INTO Leaders (LeaderID, LeaderName, Title, CountryID) VALUES
(1, 'King Charles III', 'Monarch', 1),
(2, 'Rishi Sunak', 'Prime Minister', 1),
(3, 'Emmanuel Macron', 'President', 2),
(4, 'Humza Yousaf', 'First Minister', 23),
(5, 'Sheikh Tamim bin Hamad Al Thani', 'Emir', 6),
(6, 'Recep Tayyip Erdogan', 'President', 7),
(7, 'Abdel Fattah el-Sissi', 'President', 8),
(8, 'Sheikh Mohamed bin Zayed Al Nahyan', 'President', 9),
(9, 'Narendra Modi', 'Prime Minister', 10),
(10, 'Anwaar-ul-Haq Kakar', 'Caretaker Prime Minister', 11),
(11, 'Joko Widodo', 'President', 12),
(12, 'Fumio Kishida', 'Prime Minister', 13),
(13, 'Pham Minh Chinh', 'Prime Minister', 14),
(14, 'Macky Sall', 'President', 15),
(15, 'Cyril Ramaphosa', 'President', 16),
(16, 'Bola Ahmed Tinubu', 'President', 17),
(17, 'William Ruto', 'President', 18),
(18, 'Luiz Inacio Lula da Silva', 'President', 19),
(19, 'Gustavo Francisco Petro Urrego', 'President', 20),
(20, 'Alicia Barcena', 'Foreign Minister', 21),
(21, 'Antonio Guterres', 'Secretary-General', 22),
(22, 'Rafael Mariano Grossi', 'Director-General', 23),
(23, 'Petteri Taalas', 'Secretary-General', 24),
(24, 'Tedros Adhanom Ghebreyesus', 'Director General', 25),
(25, 'Bill Gates', 'Former CEO', 26);

-- Define Conferences
CREATE TABLE Conferences (
    ConferenceID INT PRIMARY KEY,
    Year INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    AlternativeName VARCHAR(50),
    Location VARCHAR(50) NOT NULL,
    RegionalGroups VARCHAR(100)
);

-- Insert values into Conference table
INSERT INTO Conferences (ConferenceID, Year, Name, AlternativeName, Location, RegionalGroups) VALUES
(1, 1995, 'COP 1', NULL, 'Berlin', 'Western Europe and Other Group (WEOG)'),
(2, 1996, 'COP 2', NULL, 'Geneva', 'WEOG'),
(3, 1997, 'COP 3', NULL, 'Kyoto', 'Asia Group'),
(4, 1998, 'COP 4', NULL, 'Buenos Aires', 'Group of Latin America and the Caribbean (GRULAC)'),
(5, 1999, 'COP 5', NULL, 'Bonn', 'WEOG'),
(6, 2000, 'COP 6', NULL, 'The Hague', 'WEOG'),
(7, 2001, 'COP 6-2', NULL, 'Bonn', 'WEOG'),
(8, 2001, 'COP 7', NULL, 'Marrakech', 'Africa Group'),
(9, 2002, 'COP 8', NULL, 'New Delhi', 'Asia Group'),
(10, 2003, 'COP 9', NULL, 'Milan', 'WEOG (COP President: Hungary, Eastern Europe Group)'),
(11, 2004, 'COP 10', NULL, 'Buenos Aires', 'GRULAC'),
(12, 2005, 'COP 11', 'CMP 1', 'Montreal', 'WEOG'),
(13, 2006, 'COP 12', 'CMP 2', 'Nairobi', 'Africa Group'),
(14, 2007, 'COP 13', 'CMP 3', 'Bali', 'Asia Group'),
(15, 2008, 'COP 14', 'CMP 4', 'Poznań', 'Eastern Europe Group'),
(16, 2009, 'COP 15', 'CMP 5', 'Copenhagen', 'WEOG'),
(17, 2010, 'COP 16', 'CMP 6', 'Cancún', 'GRULAC'),
(18, 2011, 'COP 17', 'CMP 7', 'Durban', 'Africa Group'),
(19, 2012, 'COP 18', 'CMP 8', 'Doha', 'Asia Group'),
(20, 2013, 'COP 19', 'CMP 9', 'Warsaw', 'Eastern Europe Group'),
(21, 2014, 'COP 20', 'CMP 10', 'Lima', 'GRULAC'),
(22, 2015, 'COP 21', 'CMP 11', 'Paris', 'WEOG'),
(23, 2016, 'COP 22', 'CMP 12 / CMA 1', 'Marrakech', 'Africa Group'),
(24, 2017, 'COP 23', 'CMP 13 / CMA 1-2', 'Bonn', 'WEOG (COP President: Fiji, Asia Group)'),
(25, 2018, 'COP 24', 'CMP 14 / CMA 1-3', 'Katowice', 'Eastern Europe Group'),
(26, 2019, 'SB50', NULL, 'Bonn', 'WEOG'),
(27, 2019, 'COP 25', 'CMP 15 / CMA 2', 'Madrid', 'WEOG (COP President: Chile, GRULAC)'),
(28, 2021, 'COP 26', 'CMP 16 / CMA 3', 'Glasgow', 'WEOG'),
(29, 2022, 'COP 27', 'CMP 17 / CMA 4', 'Sharm El Sheikh', 'Africa Group'),
(30, 2023, 'COP 28', 'CMP 18 / CMA 5', 'Dubai', 'Asia Group'),
(31, 2024, 'COP 29', 'CMP 19 / CMA 6', 'Baku', 'Eastern Europe Group[8]'),
(32, 2025, 'COP 30', 'CMP 20 / CMA 7', 'Belém', 'GRULAC'),
(33, 2026, 'COP 31', 'CMP 21 / CMA 8', 'TBC', 'TBC Australia and Pacific Nations');

drop table Countires;