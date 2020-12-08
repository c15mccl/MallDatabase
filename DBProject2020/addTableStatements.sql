create table STORE (
    storeNum varchar(20) primary key,
    storeName varchar(20),
    phoneNum varchar(20),
    manID varchar(20) NOT NULL);
    
create table MANAGER (
    mID varchar(20) primary key,
    mSSN varchar(20) UNIQUE,
    mName varchar(20),
    mSalary number);
    
create table EMPLOYEES (
    eID varchar(20) primary key,
    eSSN varchar(20)  UNIQUE,
    eName varchar(20),
    eSalary number,
    hours_worked number,
    manID varchar(20) NOT NULL);
    
create table CUSTOMER (
   cID varchar(20) primary key,
   cName varchar(20),
   cEmail varchar(20));
   
create table SHOP (
    customerID varchar(20),
    storeNum varchar(20),
    primary key (customerID, storeNum));
    
create table PROTECT (
    customerID varchar(20),
    securityID varchar(20),
    dateOfIncident date,
    primary key (customerID, securityID));
    
create table SECURITY (
    sID varchar(20) primary key,
    sSSN varchar(20) UNIQUE,
    sName varchar(20),
    sSalary number); 
    
create table ASSIST (
    customerID varchar(20),
    employeeID varchar(20),
    primary key (customerID, employeeID));
    
create INDEX nameSearch on CUSTOMER( cname );
    
alter table STORE add foreign key(manID) references MANAGER(mID);
alter table EMPLOYEES add foreign key(manID) references MANAGER(mID);
alter table SHOP add foreign key(customerID) references CUSTOMER(cID);
alter table SHOP add foreign key(storeNum) references STORE(storeNum);
alter table PROTECT add foreign key(customerID) references CUSTOMER(cID);
alter table PROTECT add foreign key(securityID) references SECURITY(sID);
alter table ASSIST add foreign key(customerID) references CUSTOMER(cID);
alter table ASSIST add foreign key(employeeID) references EMPLOYEES(eID);

