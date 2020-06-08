CREATE DATABASE Hotel;
USE Hotel;
CREATE TABLE Guests
(
GuestID int not null,
FirstName Varchar(60) not null,
LastName varchar(60) not null,
Gender Char(1),
Country Varchar (20),
Email Varchar (50),
PhoneNo Int,
primary key (GuestID)
);
CREATE TABLE Staff
(
StaffID int not null,
FirstName Varchar (50) not null,
LastName Varchar (50) not null,
Gender char (1),
Position Varchar (50),
Salary Int,
Phoneno Int,
primary key(StaffID)
);
CREATE TABLE Reservation
(
ReservationID Int not null,
RName Varchar(30),
RStatus Varchar (20),
RType Varchar (20),
RDescription Varchar(50),
CustID int not null,
EmpID int not null,
primary key(ReservationID),
FOREIGN KEY (CustID) REFERENCES Guests(GuestID),
FOREIGN KEY (EmpID) REFERENCES Staff(StaffID)
);
CREATE TABLE Payment
(
PaymentID Int not null,
Type Varchar (20),
TotalPrice Varchar (50),
ReserveID Int not null,
primary key(PaymentID)
);

insert into Guests values(1,'Ali','Ahmed','M','Egypt','ali12@gmail.com',01223345566);
insert into Guests values(2,'Mohamed','Ahmed','M', 'Egypt', 'Mohamed230@gmail.com',01212334455);
insert into Guests values(3,'Galal','Khaled','M','Egypt','Galal284@gmail.com',01222924383);
insert into Guests values(4,'Mona','Hamdy','F','Egypt','Mona284@gmail.com',01228396611);
insert into Guests values(5,'Sama','Mosaad','F','Egypt','Sama0199@gmail.com',01102839912);
insert into Guests values(6,'Waled','Mohamed','M','Egypt','Waled196@gmail.com',01123939283);
insert into Guests values(7,'Nader','Ahmed','M','Egypt','Nader232@gmail.com',01029165209);
insert into Guests values(8,'Raaft','Alaa','M','Egypt','Raaft29@gmail.com',01239579382);
insert into Guests values(9,'Ziad','Nader','M','Egypt','ziad2399@gmail.com',01029384756);
insert into Guests values(10,'Khaled','Sameh','M','Egypt','Khaled29@gmail.com',01029472339);

SELECT * FROM Guests;


insert into Staff values(1,'Morad','Alaa','M','Manager',5000,0111247382);
insert into Staff values(2,'Mohamed','sameh','M','Manger',4500,01203948899);
insert into Staff values(3,'Ashraf','khaled','M','Cleaner',1200,01223928876);
insert into Staff values(4,'Abdallah','Ghally','M','Receptionist',2300,0121110029);
insert into Staff values(5,'hamed','Gad','M','Room Service',2100,01239988019);
insert into Staff values(6,'Alaa','Eslam','F','Chef', 3000,01218829387);
insert into Staff values(7,'Wesam','Ashraf','F','Chef',3000,01219882878);
insert into Staff values(8,'Eman','Ahmed','F','Chef',3000,01223887377);

SELECT * FROM Staff;

insert into Reservation values(112,'Reservation 1','Confirmed','Online','Hotel reservation',1,1);
insert into Reservation values(134,'Reservation 2','Not Confirmed','Phone','Hotel reservation',2,2);
insert into Reservation values(129,'Reservation 3','Confirmed','Online','Hotel reservation',3,3);
insert into Reservation values(137,'Reservation 4','Not Confirmed','In-Person','Hotel reservation',4,4);

SELECT * FROM Reservation ORDER BY RName ;


insert into payment values(1, 'CREDIT CARD', '550.00', 122);
insert into payment values(2, 'CASH', '690.00', 118);
insert into payment values(3, 'CREDIT CARD', '930.00', 120);
insert into payment values(4, 'CASH', '500.00', 130);
insert into payment values(5, 'CREDIT CARD', '700.00', 107);

SELECT * FROM Payment;



select * from Guests where Gender='M';
select Type from Payment where TotalPrice < 700;
select FirstName, Phoneno from Staff where LastName like 'A%';
select RType from Reservation where RStatus='Confirmed';
select LastName from Staff where Salary > 2500 and Gender ='F';


SELECT * FROM Guests INNER JOIN Staff ON Guests.GuestID=Staff.StaffID;
SELECT * FROM Guests RIGHT JOIN Staff ON Guests.LastName=Staff.LastName;
SELECT * FROM Guests LEFT JOIN Payment ON Guests.GuestID=Payment.PaymentID;
SELECT * FROM Guests INNER JOIN Staff ON Guests.Gender=Staff.Gender;
SELECT * FROM Guests INNER JOIN Staff ON Guests.FirstName=Staff.FirstName;

SELECT COUNT(*) FROM staff;
SELECT * FROM Guests ORDER BY FirstName;


UPDATE Payment SET Type = 'Cash' Where PaymentID = '1';
UPDATE Staff SET Salary = '2400' Where StaffID = 3;
UPDATE Reservation SET RStatus= 'Confirmed' Where ReservationID = '134';
UPDATE Guests SET FirstName = 'Ziad' , LastName = 'Riad' Where GuestID = 1;
Update Guests Set Email = 'Ziad283@gmail.com' Where GuestID = 1;

DELETE FROM Guests WHERE GuestID = 8;
DELETE FROM Staff WHERE StaffID = 5;
DELETE FROM Payment WHERE PaymentID = 3;
DELETE FROM Reservation WHERE ReservationID = 137;
DELETE FROM Guests WHERE GuestID = 5;
