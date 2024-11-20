-- View: Employee Payment Summary
CREATE OR REPLACE VIEW EmployeePaymentSummary AS
SELECT 
    E.EID,
    E.EName,
    SUM(T.Amount) AS TotalPaid,
    COUNT(T.TID) AS TransactionsCount
FROM 
    Employee E
LEFT JOIN 
    Transaction T ON E.EID = T.EID
GROUP BY 
    E.EID, E.EName;

-- View: Employee Leave Summary
CREATE OR REPLACE VIEW EmployeeLeaveSummary AS
SELECT 
    E.EID,
    E.EName,
    L.L_Month,
    SUM(L.L_Days) AS TotalLeaves
FROM 
    Employee E
LEFT JOIN 
    Leave L ON E.EID = L.EID
GROUP BY 
    E.EID, E.EName, L.L_Month;

-- View: Fund Transaction History
CREATE OR REPLACE VIEW FundTransactionHistory AS
SELECT 
    F.NewFund,
    F.OldFund,
    F.T_Date
FROM 
    Fund_Audit F;

-- View: Salary and Leave Details
CREATE OR REPLACE VIEW SalaryAndLeaveDetails AS
SELECT 
    E.EID,
    E.EName,
    S.Basic,
    S.Allowance,
    COALESCE(L.L_Days, 0) AS LeavesTaken,
    S.Basic + S.Allowance - (S.Basic / 30 * COALESCE(L.L_Days, 0)) AS NetSalary
FROM 
    Employee E
LEFT JOIN 
    Employee_Salary ES ON E.EID = ES.EID
LEFT JOIN 
    Salary S ON ES.SID = S.SID
LEFT JOIN 
    Leave L ON E.EID = L.EID;

-- View: Monthly Transaction Summary
CREATE OR REPLACE VIEW MonthlyTransactionSummary AS
SELECT 
    T.S_Month,
    SUM(T.Amount) AS TotalTransactionAmount,
    COUNT(T.TID) AS TotalTransactions
FROM 
    Transaction T
GROUP BY 
    T.S_Month;