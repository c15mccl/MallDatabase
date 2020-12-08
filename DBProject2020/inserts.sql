insert into SECURITY values('s3746827','111222333','Bob',35000);
insert into SECURITY values('s4562736','222333444','Bill',30000);
insert into SECURITY values('s2739576','333444555','Chuck',33000);
insert into SECURITY values('s0596737','444555666','Sam',29000);
insert into SECURITY values('s1628456','555666777','Henry',33000);

insert into PROTECT values('c3659283','s3746827','01-NOV-2020');
insert into PROTECT values('c5364665','s4562736','11-NOV-2020');
insert into PROTECT values('c8947582','s2739576','25-OCT-2020');
insert into PROTECT values('c9457983','s0596737','24-AUG-2020');
insert into PROTECT values('c8579472','s1628456','05-SEP-2020');


insert into ASSIST values('c1239875','e4389028');
insert into ASSIST values('c2376542','e1526494');
insert into ASSIST values('c3659283','e6584938');
insert into ASSIST values('c4895692','e2408095');
insert into ASSIST values('c9847598','e7592094');

insert into CUSTOMER values('c6465984','Michelle','iammich@gmail.com',0);
insert into SHOP values('c6465984','18012');
insert into SHOP values('c6465984','78849');

select *
FROM SHOP;
select *
FROM EMPLOYEES;
select *
FROM STORE;
select *
FROM CUSTOMER;
select *
FROM SECURITY;
select *
FROM ASSIST;
select *
FROM PROTECT;
select *
FROM MANAGER;

select E.ename
FROM Employees E
WHERE E.eSalary > 20000;

select E.manID, SUM(E.hours_worked)
FROM Employees E
GROUP BY E.manID;

select C.cname
FROM Customer C, Employees E, Assist A
WHERE C.cID = A.customerID and E.eID = A.employeeID and E.eSalary > 21000;

--nested query
select C.cname
FROM Customer C
WHERE C.cID in (select P.customerID
                FROM Protect P
                WHERE P.dateOfIncident='24-AUG-2020');
                




