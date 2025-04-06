create database library_demo;
show databases;
use library_demo;
CREATE TABLE readers
(
reader_id VARCHAR(6),
fname VARCHAR(30),
mname VARCHAR(30),
lname VARCHAR(30),
city VARCHAR(15),
mobileno VARCHAR(10),
occupation VARCHAR(10), 
dob DATE,
CONSTRAINT readers_pk PRIMARY KEY(reader_id)
);
INSERT INTO readers VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9834562100','Service','1993-06-24');
INSERT INTO readers VALUES('C00002','varun',null,'Pal','Pune','9838568100','Student','1999-08-24');
INSERT INTO readers VALUES('C00003','Nitin','Kumar','Saha','Kolkat','9934572100','Business','1991-06-27');
INSERT INTO readers VALUES('C00004','Rabi','Chandra','Pramanik','Bihar','8434562100','Service','1973-04-14');
INSERT INTO readers VALUES('C00005','Manas',null,'Bagchi','Kolkata','9835562100','Student','1999-01-29');
INSERT INTO readers VALUES('C00006','Rana','Kumar','Sarkar','Patna','9834592100','Service','1953-09-17');
INSERT INTO readers VALUES('C00007','Amrit','Kumar','Sadhukan','Delhi','9804562100','Service','1993-05-14');
INSERT INTO readers VALUES('C00008','Arun','Deb','Das','Kolkata','9834562190','Service','1983-03-21');
INSERT INTO readers VALUES('C00009','Mannat','Kanti','Debnath','Kalayani','6834562100','Service','1977-01-21');
select * from readers;
CREATE TABLE book
(
bid VARCHAR(6),
bname VARCHAR(40),
bdomain VARCHAR(30),
CONSTRAINT Book_id_pk PRIMARY KEY(bid)
);
INSERT INTO book VALUES('B00001','The Cat in The Hat','Story');
INSERT INTO book VALUES('B00002','Tom & Jerry','Story');
INSERT INTO book VALUES('B00003','Cinderella','Story');
CREATE TABLE active_readers
(
account_id VARCHAR(6),
reader_id VARCHAR(6),
bid VARCHAR(6),
atype VARCHAR(10),
astatus VARCHAR(10),
CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),
CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),
CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
);
select * from active_readers;
INSERT INTO active_readers VALUES('A00001','C00001','B00001','Premium','Active');
INSERT INTO active_readers VALUES('A00002','C00002','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00003','C00003','B00003','Premium','Terminated');
INSERT INTO active_readers VALUES('A00004','C00002','B00003','Premium','Active');
INSERT INTO active_readers VALUES('A00005','C00006','B00002','Regular','Active');
INSERT INTO active_readers VALUES('A00006','C00007','B00001','Regular','Active');
INSERT INTO active_readers VALUES('A00007','C00007','B00001','Regular','Active');
INSERT INTO active_readers VALUES('A00008','C00001','B00003','Premium','Active');
INSERT INTO active_readers VALUES('A00009','C00003','B00002','Regular','Active');
select * from active_readers;
CREATE TABLE bookissue_details
(
issuenumber VARCHAR(6),
account_id VARCHAR(6),
bid VARCHAR(20),
bookname VARCHAR(50),
number_of_book_issued INT(7),
CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),
CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)
);
show tables;
INSERT INTO bookissue_details VALUES('T00001','A00001','B00001','The Cat in The Hat','2');
INSERT INTO bookissue_details VALUES('T00002','A00001','B00002','The Cat in The Hat','1');
INSERT INTO bookissue_details VALUES('T00003','A00002','B00001','Cinderella','3');
INSERT INTO bookissue_details VALUES('T00004','A00002','B00003','Tom & Jerry','1');
select * from active_readers;
select * from active_readers where astatus='Terminated';
select * from active_readers where astatus='Active';
select count(account_id) from active_readers where atype='Premium';