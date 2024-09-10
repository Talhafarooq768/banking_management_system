create database banking_management_system;
use banking_management_system;

create table customers(
customer_id int  primary key,
name varchar(50) not null,
address varchar(100),
phone varchar(20),
email varchar(50)
);

select * from customers;
create table accounts(
account_id int primary key,
customer_id  int not null,
account_type varchar(20) not null,
balance decimal(10,2),
foreign key(customer_id)references customers(customer_id)
);

create table transactions(
transaction_id int primary key,
account_id int not null,
transaction_date date not null,
transaction_amount decimal(10,2) not null,
transaction_type varchar(20) not null,
foreign key(account_id)references accounts(account_id)
);

create table banks(
bank_id int primary key,
name varchar(50) not null,
address varchar(100)
);

create table employees(
employee_id int primary key,
name varchar(50) not null,
position varchar(50),
bank_id int not null,
foreign key(bank_id)references banks(bank_id)
);

create table loans(
loan_id int primary key,
customer_id int not null,
loan_amount decimal(10,2) not null,
interest_rate decimal(4,2) not null,
loan_type  varchar(20),
foreign key(customer_id)references customers(customer_id)
);

create table schedules(
scheduled_id int primary key ,
loan_id int not null,
payment_date date not null,
payment_amount decimal(10,2) not null,
foreign key(loan_id)references loans(loan_id)
);

create table Branches (
Branch_id int PRIMARY KEY ,
Name varchar(50) NOT NULL,
Address varchar(100),
Bank_Id int NOT NULL,
FOREIGN KEY (Bank_Id) REFERENCES Banks(Bank_Id)
);

-- insert data into tables
insert into customers
(Customer_id, Name, Address, Phone, Email)
VALUES
(1, 'Ahmed Ali','236 Block C, DHA Phase 1, Karachi','0333-123456','ahmed@gmail.com'),
(2, 'Sana Khan','A-187, Johar Town, Lahore','0321-6543210','sana.khan@yahoo.com'),
(3, 'Zainab Imran','42 Street 19, Block 5, Clifton, Karachi','0347-7896543','zainabimran@hotmail.com'),
(4, 'Asad Abbas','House 37, Sector 15/D, Korangi Town, Karachi','0300-4567890','asadabbas@gmail.com'),
(5, 'Fatima Jamil','123 New Muslim Town, Lahore','042-1234567','fatimajamil@yahoo.com'),
(6, 'Usman Saleem','A-150, Gulberg III, Lahore','042-9876543','usmansaleem@gmail.com'),
(7, 'Maryam Khan','Flat No. 15, St # 11, F-11 Markaz, Islamabad','051-2345678','maryamk@hotmail.com'),
(8, 'Farrukh Nadeem','Plot # 45, Street 24, DHA Phase 8, Karachi','0312-1234567','farrukhn@gmail.com'),
(9, 'Saad Ahmed','14-B, Society, Gulshan-e-Iqbal, Karachi','0322-5555555','saadahmed@hotmail.com'),
(10, 'Mehran Javed','E-78, Main Bahadurabad, Karachi','0346-9871234','mehranj@gmail.com');

select *from customers;
insert into Accounts
(Account_id, Customer_id, Account_type, Balance)
VALUES
(1, 1, 'Savings', 30000.00),
(2, 2, 'Current', 50000.00),
(3, 3, 'Savings', 80000.00),
(4, 4, 'Current', 10000.00),
(5, 5, 'Savings', 20000.00),
(6, 6, 'Current', 40000.00),
(7, 7, 'Savings', 60000.00),
(8, 8, 'Current', 25000.00),
(9, 9, 'Savings', 15000.00),
(10, 10, 'Current', 35000.00);

insert into Transactions
(Transaction_id, Account_id, Transaction_date, Transaction_amount, Transaction_type)
values
(1, 1, CURDATE(), 5000, 'Deposit'),
(2, 2, CURDATE(), 3000, 'Withdrawal'),
(3, 3, CURDATE(), 10000, 'Deposit'),
(4, 4, CURDATE(), 2000, 'Withdrawal'),
(5, 5, CURDATE(), 8000, 'Deposit'),
(6, 6, CURDATE(), 4000, 'Withdrawal'),
(7, 7, CURDATE(), 1000, 'Deposit'),
(8, 8, CURDATE(), 7000, 'Withdrawal'),
(9, 9, CURDATE(), 2000, 'Deposit'),
(10, 10, CURDATE(), 6000, 'Withdrawal');

insert into Banks (Bank_id, Name, Address)
values
(1, 'Habib Bank Limited', 'I.I. Chundrigar Rd, Karachi'),
(2, 'United Bank Limited', 'Centrepoint, Plot No 66/C-1, Gulberg III, Lahore'),
(3, 'MCB Bank Limited', 'I.I. Chundrigar Rd, Karachi'),
(4, 'National Bank of Pakistan', 'Shahrah-e-Quaid-e-Azam, Lahore'),
(5, 'Meezan Bank', '19th Commercial Street, Phase VI, DHA, Karachi'),
(6, 'Bank Alfalah', '84-E/1, Jinnah Avenue, Blue Area, Islamabad'),
(7, 'Faysal Bank', 'Faisalabad Road, Block A, DHA Phase 8, Karachi'),
(8, 'JS Bank', 'City Tower, Tehkamet Iqbal Road, Lahore'),
(9, 'Askari Bank', 'Plot 21, Sector 24, Korangi Industrial Area, Karachi'),
(10, 'Bank Al Habib', 'I.I. Chundrigar Road, Karachi');


insert into Employees (Employee_id, Name, Position, Bank_id)
values
(1, 'Ali Ahmed', 'Manager', 1),
(2, 'Sumaira Khan', 'Assistant Manager', 2),
(3, 'Asif Iqbal', 'Customer Service Officer', 3),
(4, 'Sara Jamal', 'Branch Head', 4),
(5, 'Umair Siddiqui', 'Loan Officer', 5),
(6, 'Maryam Tariq', 'Cashier', 6),
(7, 'Abdul Rehman', 'Manager', 7),
(8, 'Kinza Naeem', 'Relationship Manager', 8),
(9, 'Hamza Arshad', 'Customer Service Officer', 9),
(10, 'Ayesha Mehmood', 'Branch Manager', 10);

insert into Loans
(Loan_id, Customer_id, Loan_amount, Interest_rate, Loan_type)
values
(1, 1, 500000, 12.50, 'Car'),
(2, 2, 1500000, 13.25, 'House'),
(3, 3, 300000, 12.75, 'Personal'),
(4, 4, 800000, 11.50, 'Business'),
(5, 5, 1000000, 12.00, 'House'),
(6, 6, 250000, 13.00, 'Personal'),
(7, 7, 1800000, 12.25, 'House'),
(8, 8, 500000, 11.75, 'Car'),
(9, 9, 300000, 12.50, 'Personal'),
(10, 10, 1000000, 12.25, 'House');


INSERT INTO Schedules
(Scheduled_id, Loan_id, Payment_date, Payment_amount)
VALUES
(1, 1, '2022-01-01', 20000),
(2, 2, '2022-02-01', 40000),
(3, 3, '2022-03-01', 10000),
(4, 4, '2022-04-01', 25000),
(5, 5, '2022-05-01', 30000),
(6, 6, '2022-06-01', 8000),
(7, 7, '2022-07-01', 45000),
(8, 8, '2022-08-01', 20000),
(9, 9, '2022-09-01', 10000),
(10, 10, '2022-10-01', 30000);


INSERT INTO Branches
(Branch_id, Name, Address, Bank_Id)
VALUES
(1, 'Defence Branch', '60 Street 24, DHA Phase 5, Karachi', 1),
(2, 'Gulberg Branch', 'M-36, Gulberg III, Lahore', 2),
(3, 'Clifton Branch', 'A-1, Block 4, Clifton, Karachi', 3),
(4, 'Johar Town Branch', 'A1 Johar Town, Lahore', 4),
(5, 'Saddar Branch', 'Emporium Mall, Abdullah Haroon Rd, Karachi', 5),
(6, 'Islamabad Branch', 'F-11 Markaz, Islamabad', 6),
(7, 'Garden Town Branch', '147-K Block, Garden Town, Lahore', 7),
(8, 'Sohrab Goth Branch', 'Main Rashid Minhas Rd, Karachi', 8),
(9, 'Phase 8 Branch', 'DHA Phase 8, Karachi', 9),
(10, 'Faisalabad Branch', 'Allama Iqbal Rd, Faisalabad', 10);




-- cross join / cartion product

SELECT * FROM banks
cross join transactions
on banks.bank_id=transactions.transaction_id;

-- left join 
Select * FROM transactions
left JOIN banks
ON transactions.transaction_id = banks.bank_id;  

-- right join 
 select * from customers
right join transactions
on customers.customer_id=transactions.transaction_id;

-- unoin
Select customer_id from customers
UNION 
Select transaction_amount from transactions;

-- selection /select row in a table
SELECT * FROM loans
WHERE loan_amount > 25000.00;

-- projection /select column in a table
select loan_amount, loan_type from loans;

-- update  
-- UPDATE Schedules SET Payment_date = '2022-01-09' WHERE Loan_id = 1;

