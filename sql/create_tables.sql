-- Table: Employee
CREATE TABLE Employee (
    EID NUMBER(5) PRIMARY KEY,
    EName VARCHAR2(50),
    Gender VARCHAR2(10),
    Email VARCHAR2(100),
    JoinDate DATE
);

-- Table: Salary
CREATE TABLE Salary (
    SID NUMBER(5) PRIMARY KEY,
    Basic NUMBER(10, 2),
    Allowance NUMBER(10, 2)
);

-- Table: Employee_Salary
CREATE TABLE Employee_Salary (
    EID NUMBER(5) REFERENCES Employee(EID),
    SID NUMBER(5) REFERENCES Salary(SID),
    PRIMARY KEY (EID, SID)
);

-- Table: Leave
CREATE TABLE Leave (
    LID NUMBER(5) PRIMARY KEY,
    EID NUMBER(5) REFERENCES Employee(EID),
    L_Month VARCHAR2(10),
    L_Days NUMBER(3)
);

-- Table: Fund
CREATE TABLE Fund (
    FID NUMBER(5) PRIMARY KEY,
    Fund_Amount NUMBER(15, 2)
);

-- Table: Fund_Audit
CREATE TABLE Fund_Audit (
    NewFund NUMBER(15, 2),
    OldFund NUMBER(15, 2),
    T_Date DATE
);

-- Table: Transaction
CREATE TABLE Transaction (
    TID NUMBER(5) PRIMARY KEY,
    EID NUMBER(5) REFERENCES Employee(EID),
    Amount NUMBER(15, 2),
    T_Date DATE,
    S_Month VARCHAR2(10)
);

-- Table: EmpSalary_Audit
CREATE TABLE EmpSalary_Audit (
    EID NUMBER(5),
    NewSID NUMBER(5),
    OldSID NUMBER(5),
    ChangingDate DATE
);