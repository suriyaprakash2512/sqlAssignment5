CREATE DATABASE Assessment05Db;
USE Assessment05Db;

CREATE SCHEMA bank;

CREATE TABLE bank.Customer (
    CId INT PRIMARY KEY identity (1000,1) NOT NULL,
    CName NVARCHAR(100) NOT NULL,
    CEmail NVARCHAR(100) UNIQUE NOT NULL,
	Contact varchar (10) not null unique check (contact like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CPwd as	 CONCAT(SUBSTRING(CName, LEN(CName) - 1, 2), 
   SUBSTRING(CAST(Cid AS VARCHAR),
   LEN(CAST(Cid AS VARCHAR)) - 1, 2), 
   SUBSTRING(contact, 1, 2))  Persisted   
)  

select * from bank.Customer

CREATE TABLE bank.Mailinfo(
    MailTo NVARCHAR(100) NOT NULL,
    MailDate DATE default getdate(),
    MailMessage NVARCHAR(100) NOT NULL
);

select * from bank.Mailinfo

CREATE TRIGGER bank.trgMailToCust
ON bank.Customer
AFTER INSERT
AS
BEGIN
    INSERT INTO bank.Mailinfo (MailTo, MailDate, MailMessage)
    SELECT CEmail, GETDATE(), 'Your net banking password is: ' + CPwd + '. It is valid up to 2 days only. Update It'
    FROM inserted;
END;

INSERT INTO bank.Customer (CName, CEmail, Contact) VALUES
('Arjun', 'arjun11@gmail.com', '9875624311'),
('peter', 'peter@gmail.com', '7655145689'),
('Alias', 'Alias555@gmail.com', '9977432006');

select * from bank.Customer
select * from bank.Mailinfo








