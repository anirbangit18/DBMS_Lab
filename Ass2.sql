Day 5:
-----------------------------------------------------------------------------------------------------
create table dept(dept_id number(3) primary key, dept_name varchar2(15));
insert into dept values('&dept_id', '&dept_name');

create table cust_10(
	emp_id number(3) primary key,
	first_name varchar2(10) check(first_name=initcap(first_name)),
	last_name varchar2(10) check(last_name=initcap(last_name)) not null,
	e_mail varchar2(20) check(e_mail=upper(e_mail)),
	ph_no varchar2(15),
	hire_date date check(hire_date>'01-JAN-1980'),
	job_id varchar2(10) check(job_id like 'AD%' or job_id like 'FI%' or job_id like 'IT%'),
	salary number(8,2) check(salary between 4000 and 25000),
	mgr_id number(3),
	dept_id number(3) references Dept(dept_id)
);

1. insert into cust_100 values('&emp_id', '&firstname', '&lastname', '&Email', '&ph_no', '&hire_date', '&job_id', '&salary', '&Mgr_id', '&dept_id');

4. SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME='CUST_100';

