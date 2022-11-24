-- Group 13
-- Members Anirudha Chowdhury, Pradeep Singh, Revathi Mahadevan, Yuvraj Singh Harsh

-- SQL Queries

-- PART 1,2,3,4,5 and 6 done by Anirudha Chowdhury
1. create database [LMT_University]

2.USE [LMT_University]
  GO

  /****** Object:  Schema [enrol]    Script Date: 11/15/2022 3:54:38 PM ******/
  CREATE SCHEMA [enrol]
  GO
3. -- We have used the enrol schema to make the project

4-- Aur Dataset Model looks like the one specified in the rubric

5. CREATE TABLE [enrol].Address(
AddressID int NOT NULL identity(1,1) primary key,
StreetAddress varchar(max) NULL,
City varchar(max) NOT NULL,
State varchar(max) NULL,
PostalCode varchar(max) NULL,
Country varchar(max) NOT NULL,
InsertedOn datetime NOT NULL
)
-- we have used the the edit top 200 rows feature of SQL to Enter the data into the tables

6.CREATE TABLE [enrol].Department(
DepartmentID int NOT NULL identity(1,1) primary key,
DepartmentName varchar(max) NOT NULL,
DepartmentDescription varchar(max) NULL,
DepartmentCapacity int NOT NULL,
InsertedOn datetime NOT NULL
)
-- we have used the the edit top 200 rows feature of SQL to Enter the data into the tables

-- Part 7 and 8 has been Done by Yuvraj Singh Harsh

7. CREATE TABLE [enrol].Lecturer(
LecturerID int NOT NULL identity(1,1) primary key,
LecturerName varchar(max) NOT NULL,
LecturerHighestQualification varchar(max) NULL,
LecturerAge date NOT NULL,
DepartmentID int NOT NULL foreign key references enrol.Department(DepartmentID),
InsertedOn datetime NULL
)
-- -- we have used the the edit top 200 rows feature of SQL to Enter the data into the tables
8.CREATE TABLE [enrol].Student(
StudentID int NOT NULL identity(1,1) primary key,
StudentFirstName varchar(max) NOT NULL,
StudentLastName varchar(max) NULL,
StudentDOB date NOT NULL,
StudentMobile varchar(max) NULL,
StudentRollNo int NOT NULL,
DepartmentID int NOT NULL foreign key REFERENCES enrol.Department(DepartmentID),
AddressID int NOT NULL foreign key REFERENCES enrol.Address(AddressID),
InsertedOn datetime NOT NULL
)
-- we have used the the edit top 200 rows feature of SQL to Enter the data into the tables


--Part 9 
--Questions A to M of Part  9 haven been done by Pradeep Singh
9a. select * from [enrol].[Student]

9b. select * from [enrol].[Department]

9c. select * from [enrol].[Lecturer]

9d. select * from [enrol].[Address]

9e. select 
CONCAT(StudentFirstName,' ',StudentLastname) as [StudentFullname],
[StudentDOB],
[StudentMobile]
from [enrol].[Student]

9f. select 
[StudentID],
[StudentFirstName],
[StudentLastname],
[StudentDOB],
[StudentMobile]
from [enrol].[Student]
where [AddressID] = '7'

9g. select * from [enrol].[Student] where [StudentFirstName] LIKE 'B%';

9h. select * from [enrol].[Student] where LEFT([StudentFirstName], 1) IN ('A') and RIGHT([StudentFirstName], 1) IN ('A')

9i. select COUNT([StudentFirstName]) FROM [enrol].[Student] WHERE [DepartmentID] = '6'

9j.  select 
CONCAT(StudentFirstName,' ',StudentLastname) as [StudentFullname],
DATEDIFF(year, [StudentDOB], getdate()) AS [StudentAge],
[StudentMobile]
from [enrol].[Student]

9k. select 
CONCAT(StudentFirstName,' ',StudentLastname) as [StudentFullname],
DATEDIFF(year, [StudentDOB], getdate()) AS [StudentAge],
[StudentMobile]
FROM [enrol].[Student]
where DATEDIFF(year, [StudentDOB], getdate()) > 23

9L. select 
CONCAT(StudentFirstName,' ',StudentLastname) as [StudentFullname],
DATEDIFF(year, [StudentDOB], getdate()) AS [StudentAge],
[StudentMobile]
FROM [enrol].[Student]
where DATEDIFF(year, [StudentDOB], getdate()) = '21' OR DATEDIFF(year, [StudentDOB], getdate()) = '23'

9m. select 
[LecturerID],
[LecturerName],
[LecturerHighestQualification],
[LecturerAge]
from [enrol].[Lecturer]

--Question N to S have been Done by Anirudha Chowdhury
9n. select 
[LecturerID],
[LecturerName],
[LecturerHighestQualification],
[LecturerAge]
from [enrol].[Lecturer]
where [LecturerHighestQualification] = 'MS' OR [LecturerHighestQualification] = 'PhD' 

9o. select * from [enrol].[Lecturer]
where [DepartmentID] = '2'  

9p. select * from [enrol].[Lecturer] where [LecturerName] LIKE '%R';

9q. select * from [enrol].[Lecturer] where LEFT([LecturerName], 1) IN ('E') OR RIGHT([LecturerName], 1) IN ('E')

9r. select UPPER([LecturerName]) as dUpper
from [enrol].[Lecturer] ;

9s. select 
LEFT([LecturerName],5) as NameFirst5,
[LecturerId],
[LecturerHighestQualification]
from [enrol].[Lecturer] ;

-- Questions T to Y have Been done by Yuvraj Singh Harsh
9t. select 
[LecturerId],
[LecturerName],
[LecturerHighestQualification],
DATEDIFF(year, [LecturerAge], getdate()) AS [LecturerAge(in Year)]
from [enrol].[Lecturer] ;

9u. select
[DepartmentID],
[DepartmentName],
[DepartmentDescription],
[DepartmentCapacity]
from [enrol].[Department]

9v. select * from [enrol].[Department] where [DepartmentName] = 'ECE'

9w. select
[DepartmentName],
[DepartmentDescription],
[DepartmentCapacity]
from [enrol].[Department]
where [DepartmentCapacity] > '60'

9x. select
[AddressID],
[StreetAddress],
[City],
[State],
[PostalCode],
[Country]
from [enrol].[Address]

9y. select
[AddressID],
[StreetAddress],
[City],
[State],
[PostalCode],
[Country]
from [enrol].[Address]
where [Country] = 'Poland'

-- Question Z to AA have been done by Revathi Mahadevan
9z. select * from [enrol].[Address] where [State] IS NULL

9aa. select * from [enrol].[Address] where [PostalCode] IS NOT NULL

9bb. select * from [enrol].[Address] where [City] = 'Honda' AND [Country] = 'Colombia'

--Part 10
-- All Question in Part 10 done by Revathi Mahadevan

10a. select DISTINCT [StudentDOB]
from [enrol].[Student]

10b. select DISTINCT [DepartmentName]
from [enrol].[Department]

10c. select DISTINCT [Country]
from [enrol].[Address]

10d. select DISTINCT [State]
from [enrol].[Address]

10e. select DISTINCT [City]
from [enrol].[Address]

10f. select 
[LecturerID],
[LecturerName],
[LecturerHighestQualification],
DATEDIFF(year, [LecturerAge], getdate()) AS LecturerYearService
from [enrol].[Lecturer]

10g. select [LecturerID],[LecturerName],[LecturerHighestQualification],
case
	when DATEDIFF(year, [LecturerAge], getdate())  < 5 then 'Begining Level Experience'
	when DATEDIFF(year, [LecturerAge], getdate()) >= 5 AND DATEDIFF(year, [LecturerAge], getdate())  < 10 then 'Mid Level experience'
	else 'Experienced'
end LecturerType
from [enrol].[Lecturer]

--Part 11
--Part 11 Questions A to F have been done by Revathi Mahadevan

11a. select * from [enrol].[Student] JOIN [enrol].[Department] ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]

11b. select * from [enrol].[Student] JOIN [enrol].[Address] ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]

11c. select * from [enrol].[Department] JOIN [enrol].[Lecturer] ON [enrol].[Department].[DepartmentID] = [enrol].[Lecturer].[DepartmentID]

11d. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Department] 
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
JOIN
[enrol].[Lecturer]
ON [enrol].[Lecturer].[DepartmentID] = [enrol].[Department].[DepartmentID]

11e. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
JOIN
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]

11f. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
JOIN
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
JOIN
[enrol].[Lecturer]
ON [enrol].[Student].[DepartmentID] = [enrol].[Lecturer].[DepartmentID]

-- Questions G to L have been done Anirudha Chowdhury
11g. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
JOIN
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
AND [enrol].[Department].[DepartmentName] = 'ME' OR [enrol].[Department].[DepartmentName] = 'ECE'
JOIN
[enrol].[Lecturer]
ON [enrol].[Student].[DepartmentID] = [enrol].[Lecturer].[DepartmentID]

11h. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
JOIN
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
JOIN
[enrol].[Lecturer]
ON [enrol].[Student].[DepartmentID] = [enrol].[Lecturer].[DepartmentID]
AND [enrol].[Lecturer].[LecturerHighestQualification] = 'MS' OR [enrol].[Lecturer].[LecturerHighestQualification] = 'PhD' 

11i. select * 
from [enrol].[Student] 
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
AND [enrol].[Address].[Country] = 'Thailand'
JOIN
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]

11j. select [DepartmentName],COUNT([StudentID]) from [enrol].[Department] 
JOIN
[enrol].[Student]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
GROUP BY ([enrol].[Department].[DepartmentName])

11k. select [DepartmentName],COUNT([LecturerID]) from [enrol].[Department] 
JOIN
[enrol].[Lecturer]
ON [enrol].[Lecturer].[DepartmentID] = [enrol].[Department].[DepartmentID]
GROUP BY ([enrol].[Department].[DepartmentName])

11L. select [Country],COUNT([StudentID]) from [enrol].[Address] 
JOIN
[enrol].[Student]
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
GROUP BY ([enrol].[Address].[Country])

-- Part 12
-- All Question in Part 12 has Been done by Yuvraj Singh Harsh

12a. select * INTO StudCopy 
FROM [enrol].[Student];

12b. USE [LMT_University]
GO
/****** Object:  Schema [enrol]    Script Date: 11/12/2022 12:16:05 AM ******/
CREATE SCHEMA [enrolCopy1]
GO
/****** Object:  Table [enrol].[Department]    Script Date: 11/12/2022 12:16:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [enrol].[DeptCopy](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](max) NOT NULL,
	[DepartmentDescription] [varchar](max) NULL,
	[DepartmentCapacity] [int] NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

12c. select * INTO  DepartmentCopy  
FROM [enrol].[Department];

12d. USE [LMT_University]
GO
/****** Object:  Schema [enrol]    Script Date: 11/12/2022 12:18:20 AM ******/
CREATE SCHEMA [enrolCopy3]
GO
/****** Object:  Table [enrol].[Address]    Script Date: 11/12/2022 12:18:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [enrol].[AddrCopy](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](max) NULL,
	[City] [varchar](max) NOT NULL,
	[State] [varchar](max) NULL,
	[PostalCode] [varchar](max) NULL,
	[Country] [varchar](max) NOT NULL,
	[InsertedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


12e. select * INTO  AddrCopy  
FROM [enrol].[Address];

12f. select * INTO  LecturerCopy  
FROM [enrol].[Lecturer];

-- Part 13
--All Question in Part 13 have been done by Anirudha Chowdhury

13a. DELETE FROM LecturerCopy;

13b. DELETE [enrol].[Student] FROM [enrol].[Student]
JOIN 
[enrol].[Department] 
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
WHERE [DepartmentName] = 'IT'

13c. DELETE [enrol].[Student] FROM [enrol].[Student]
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
WHERE [Country] = 'Indonesia'

13d. DELETE [enrol].[Student] FROM [enrol].[Student]
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
WHERE [City] = 'Nanshi'

13e. DELETE [enrol].[Student] FROM [enrol].[Student]
JOIN 
[enrol].[Address] 
ON [enrol].[Student].[AddressID] = [enrol].[Address].[AddressID]
WHERE [State] = 'Bretagne'

-- Part 14
-- All Question in Part 14 Haven been done By Yuvraj Singh Harsh
14a. UPDATE [enrol].[Student]
SET [StudentMobile] = '845987653'
FROM 
[enrol].[Student]
JOIN 
[enrol].[Department]
ON [enrol].[Student].[DepartmentID] = [enrol].[Department].[DepartmentID]
WHERE [DepartmentName] = 'ME'

14b. UPDATE [enrol].[Student]
SET [DepartmentID] = '3'
WHERE [StudentID] = '42'

14c. UPDATE [enrol].[Lecturer]
SET [LecturerHighestQualification] = 'PHd'
WHERE [LecturerHighestQualification] = 'PhD'

14d. UPDATE [enrol].[Address]
SET [PostalCode] = '00000'
WHERE [PostalCode] IS NULL

14e. UPDATE [enrol].[Student]
SET [StudentLastName] = 'Paul'
WHERE [StudentLastName] = 'Jerry'












