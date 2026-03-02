Employee Payroll System:

An Employee Payroll System is a software solution designed to automate and
manage the financial records of employees. This system allows for efficient
handling of salary payments, deductions, bonuses, taxes, and other payroll-
related transactions. It simplifies the payroll process by ensuring accuracy,
transparency, and timely payment to employees, reducing the likelihood of
human errors associated with manual payroll management.
Features of the Project:
 Employee salary management
 Tax and bonus calculations
 Payroll report generation
 User roles for HR and employees;


create database Employee_payroll;

use Employee_payroll;

create table employee_table(employee_id int primary key,
employee_name varchar(200),
department varchar(100),
position varchar(100),
hire_date DATE,
base_salary decimal(10,2)
);

INSERT INTO employee_table (employee_id, employee_name, department, position, hire_date, base_salary)
VALUES
(1, 'Alice Johnson', 'HR', 'HR Manager', '2020-03-15', 65000.00),
(2, 'Bob Smith', 'Finance', 'Accountant', '2019-07-10', 55000.00),
(3, 'Charlie Lee', 'IT', 'Software Engineer', '2021-01-22', 72000.00),
(4, 'Diana Patel', 'Marketing', 'Marketing Specialist', '2022-09-05', 48000.00),
(5, 'Ethan Brown', 'IT', 'System Administrator', '2018-11-18', 69000.00),
(6, 'Fiona White', 'Finance', 'Financial Analyst', '2023-05-02', 53000.00);


create table attendance_table(attendance_id int primary key,
employee_id int,
attendance_date date,
attendance_status varchar(50)
);

Inserting Data:
Add some sample data to the tables;

INSERT INTO attendance_table (attendance_id, employee_id, attendance_date, attendance_status)
VALUES
(1, 1, '2025-11-01', 'Present'),
(2, 2, '2025-11-01', 'Present'),
(3, 3, '2025-11-01', 'Absent'),
(4, 4, '2025-11-01', 'Present'),
(5, 5, '2025-11-01', 'Present'),
(6, 6, '2025-11-01', 'Present');

create table salaries_table(salary_id int primary key,
employee_id int,
base_salary decimal(10,2),
bonus decimal(10,2),
deductions decimal(10,2),
month varchar(100),
year int
);

INSERT INTO salaries_table (salary_id, employee_id, base_salary, bonus, deductions, month, year)
VALUES
(1, 1, 65000.00, 2000.00, 500.00, 'October', 2025),
(2, 2, 55000.00, 1500.00, 300.00, 'October', 2025),
(3, 3, 72000.00, 2500.00, 800.00, 'October', 2025),
(4, 4, 48000.00, 1000.00, 200.00, 'October', 2025),
(5, 5, 69000.00, 2200.00, 700.00, 'October', 2025),
(6, 6, 53000.00, 1200.00, 400.00, 'October', 2025);

create table pay_roll(payroll_id int primary key,
employee_id int,
total_salatry decimal(10,2),
payment_date date
);

INSERT INTO pay_roll (payroll_id, employee_id, total_salatry, payment_date)
VALUES
(1, 1, 66500.00, '2025-10-31'),
(2, 2, 56200.00, '2025-10-31'),
(3, 3, 73700.00, '2025-10-31'),
(4, 4, 48800.00, '2025-10-31'),
(5, 5, 70500.00, '2025-10-31'),
(6, 6, 53800.00, '2025-10-31')
;

alter table pay_roll 
rename column total_salatry to total_salary;

select * from pay_roll;

Queries

1. Add New Employees:
o Allow users to enter new employee records into the system (name,
department, position, salary, etc.);

INSERT INTO employee_table (employee_id, employee_name, department, position, hire_date, base_salary)
VALUES
(7, 'Robbert', 'IT', 'Data Analyst', '2018-08-12', 60000.00
);

2. Update Employee Information:
o Provide functionality to update existing employee details (e.g., position,
salary, department);

update employee_table 
set department="marketing", position="marketing manager" ,base_salary="82000" 
where employee_id=1;

3. Delete Employee Records:
o Enable users to remove employee records when no longer needed or
relevant;

delete from employee_table
where employee_id=3;

4. Track Employee Attendance:
o Record daily attendance for employees, marking them as present,
absent, or on leave;

select employee_name,attendance_status 
from employee_table right join attendance_table 
on employee_table.employee_id=attendance_table.employee_id
where attendance_date="2025-11-01";

5. Calculate Salary:.
o Automatically calculate employee salaries based on base salary,
attendance, bonuses, and deductions;

select employee_id,employee_name,(salaries_table.base_salary+salaries_table.bonus-salaries_table.deduction)
as total_salary from employee_table inner join salaries_table on employee_table.employee_id=salaries_table.employee_id;

6. Manage Deductions and Bonuses:
o Allow users to add or update bonuses and deductions for each
employee;

SET SQL_SAFE_UPDATES = 0;

update salaries_table
set bonus=2400
where employee_id=2; 

7. Update Payroll Records:
o Calculate and store payroll data for each employee, including total
salary and payment date;

select employee_id,total_salary,payment_date 
from pay_roll;

8. Generate Pay Slips:
o Provide functionality to generate detailed pay slips for employees,
showing salary breakdowns;

select employee_table.employee_id,employee_table.employee_name,employee_table.base_salary,
salaries_table.bonus,salaries_table.deductions,
pay_roll.total_salary
from employee_table 
inner join salaries_table on employee_table.employee_id=salaries_table.employee_id
inner join pay_roll on  employee_table.employee_id=pay_roll.employee_id; 


select * from employee_table inner join attendance_table,pay_roll,salaries_table;

9. Generate Payroll Reports:
o Create payroll summaries and reports, such as overall salary
expenses, employee attendance, or monthly payroll distributions;

select employee_table.employee_id,employee_table.employee_name,employee_table.base_salary,
attendance_table.attendance_date,attendance_table.attendance_status,
salaries_table.bonus,salaries_table.deductions,salaries_table.month,salaries_table.year,
pay_roll.payment_date,pay_roll.total_salary
from employee_table
inner join attendance_table on employee_table.employee_id=attendance_table.employee_id
inner join salaries_table on employee_table.employee_id=salaries_table.employee_id
inner join pay_roll on employee_table.employee_id=pay_roll.employee_id;

