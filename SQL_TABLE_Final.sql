DROP TABLE Violation CASCADE CONSTRAINTS;
CREATE TABLE Violation(
ViolationDimID number(15) not null,
InspectionDate DATE,
ApprovedDate DATE,
CertifiedDate DATE,
ViolationType VARCHAR2(20),
primary key (ViolationDimID)
);

DROP TABLE Address CASCADE CONSTRAINTS;
CREATE TABLE Address (
AddressDimID number(15) not null,
BuildingID number(8),
BoroID number(1),
Borough VARCHAR2(20),
HouseNumber VARCHAR2(20), 
StreetName VARCHAR2(40),
StreetCode number(8),
Postcode number(8),
Apartment VARCHAR2(20),
Story VARCHAR2(20),
Latitude VARCHAR2(20),
Longitude VARCHAR2(20),
BIN number(8),
primary key (AddressDimID)
);

DROP TABLE NoticeOfViolation CASCADE CONSTRAINTS;
CREATE TABLE NoticeOfViolation (
NovDimID number(15) not null,
NOVID number(10),
NOVDescription VARCHAR2(1000),
NOVIssueDate DATE,
NOVType VARCHAR2(20),
PRIMARY KEY (NovDimID)
);

DROP TABLE Status CASCADE CONSTRAINTS;
CREATE TABLE Status (
StatusDimID NUMBER(15) NOT NULL,
CurrentStatusID NUMBER(3),
Class VARCHAR2(2), 
CurrentStatus  VARCHAR2(40),
CurrentStatusDate Date,
ViolationStatus VARCHAR2(5),
RentImpairing VARCHAR2(1),
PRIMARY KEY (StatusDimID)
);

DROP TABLE Registration CASCADE CONSTRAINTS;
CREATE TABLE Registration (
RegistrationDimID NUMBER(15) not null,
RegistrationID NUMBER(10),
OrderNumber NUMBER(10),
PRIMARY KEY (RegistrationDimID)
);

DROP TABLE ViolationFact CASCADE CONSTRAINTS;
CREATE TABLE ViolationFact  (
ViolationID NUMBER(8) not null,
ViolationDimID number(15) not null,
AddressDimID number(15) not null,
NovDimID number(15) not null,
StatusDimID NUMBER(15) NOT NULL,
PRIMARY KEY (ViolationID),
FOREIGN KEY (ViolationDimID) REFERENCES Violation(ViolationDimID),
FOREIGN KEY (AddressDimID) REFERENCES Address(AddressDimID),
FOREIGN KEY (NovDimID) REFERENCES NoticeOfViolation(NovDimID),
FOREIGN KEY (StatusDimID) REFERENCES Status(StatusDimID)
);

DROP TABLE OrderFact CASCADE CONSTRAINTS;
CREATE TABLE OrderFact (
OrderID NUMBER(15) not null,
StatusDimID NUMBER(15) NOT NULL,
RegistrationDimID NUMBER(15) NOT NULL,
PRIMARY KEY (OrderID),
FOREIGN KEY (StatusDimID) REFERENCES Status(StatusDimID),
FOREIGN KEY (RegistrationDimID) REFERENCES Registration(RegistrationDimID)
);