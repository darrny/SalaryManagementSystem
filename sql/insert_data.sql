-- Insert Employees
INSERT INTO Employee VALUES (1, 'John Doe', 'Male', 'john.doe@example.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO Employee VALUES (2, 'Jane Smith', 'Female', 'jane.smith@example.com', TO_DATE('2023-02-01', 'YYYY-MM-DD'));

-- Insert Salary Details
INSERT INTO Salary VALUES (1, 3000, 500);
INSERT INTO Salary VALUES (2, 4000, 600);

-- Assign Salary to Employees
INSERT INTO Employee_Salary VALUES (1, 1);
INSERT INTO Employee_Salary VALUES (2, 2);

-- Insert Leaves
INSERT INTO Leave VALUES (1, 1, '2024-11', 2);
INSERT INTO Leave VALUES (2, 2, '2024-11', 1);

-- Insert Fund
INSERT INTO Fund VALUES (1, 100000);

-- Insert Transactions
INSERT INTO Transaction VALUES (1, 1, 3200, TO_DATE('2024-11-15', 'YYYY-MM-DD'), '2024-11');
INSERT INTO Transaction VALUES (2, 2, 4600, TO_DATE('2024-11-15', 'YYYY-MM-DD'), '2024-11');