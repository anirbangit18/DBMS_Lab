sqlplus64
CSE1032/academy@192.168.18.6:1521/ORCL

1. select concat(cust_first_name, concat(' ',cust_last_name)) as customer_name from new_customer;
2. select count(*) as TOTAL_MARRIED from new_customer where MARITORIAL_STATUS='Married';
3. select count(*) as TOTAL_FEMALES from new_customer where SEX='F';
4. select count(TERRITORY) as TERRITORIES from new_customer;
5. select count(distinct TERRITORY) as TERRITORIES from new_customer;
6. select * from new_customer order by territory;
7. select * from customer where mgr_id=(select cust_id from customer where cust_first_name='Ishwarya' and cust_last_name='Roberts') and cust_first_name<>'Ishwarya';


Q---> Find all the customer live in Rob Russell's territory..
A---> select concat(concat(Cust_first_name, ' '), cust_last_name) as customer_name from customer where territory=(select territory from customer where concat(cust_first_name, cust_last_name)='RobRussell'); OR
	  select concat(concat(c.cust_first_name, ' '), c.cust_last_name) from customer c, customer m where c.territory=m.territory and concat(m.cust_first_name,m.cust_last_name)='RobRussell';
	***add "and concat(c.cust_first_name,c.cust_last_name)='RobRussell'" if we don't want Rob Russell himself.***


8. select concat(concat(c.Cust_first_name, ' '), c.cust_last_name) as customer_name from customer c, customer m where m.cust_id=c.mgr_id and concat(m.cust_first_name,m.cust_last_name)='IshwaryaRoberts' and c.gender='F';

9. select concat(concat(c.Cust_first_name, ' '), c.cust_last_name) as customer_name from customer c, customer m where m.cust_id=c.mgr_id and concat(m.cust_first_name,m.cust_last_name)='IshwaryaRoberts' and c.Maritorial_status='Married';

10. select concat(concat(c.Cust_first_name, ' '), c.cust_last_name) as customer_name from customer c, customer m where m.cust_id=c.mgr_id and concat(m.cust_first_name,m.cust_last_name)='IshwaryaRoberts' and c.Maritorial_status='Married' and extract(year from sysdate) - extract(year from c.dob)<50;

select concat(concat(c.Cust_first_name, ' '), c.cust_last_name) as customer_name from customer c, customer m where m.cust_id=c.mgr_id and concat(m.cust_first_name,m.cust_last_name)='IshwaryaRoberts' and c.Maritorial_status='Married' and ((sysdate-c.dob)/365)<50;


