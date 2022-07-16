
Day 10:
------------------------------------------------------------------------------------
Assignment 8:PLSQL

1.
declare
	m number(5,2);
	g varchar(1);

begin
	m:='&marks';
	if m>89 and m<=100	then g:='O';
	elsif m>79 and m<=89	then g:='E';
	elsif m>69 and m<=79	then g:='A';
	elsif m>39 and m<=69	then g:='B';
	else	g:='F';
	end if;
	dbms_output.put_line('grade is '|| g);
end;
/


2.
declare
	n number(10);
	curr number(10):=0;

begin
	n:='&number';
	loop
		dbms_output.put_line(curr);
		curr:=curr+2;
		exit when curr>n;
	end loop;
end;
/
	
3.
declare
	n number(10);
	fact number(10):=1;
begin
	n:='&number';
	for i in 1..n loop
		fact:=fact*i;
	end loop;
	dbms_output.put_line('The factorial is: '||fact);
end;
/

4.
declare 
	a number(10):=0;
	b number(10):=1;
	c number(10):=0;
	n number(10);
begin
	n:='&number';
	while (c<=n) loop
		dbms_output.put_line(c);
		a:=b;
		b:=c;
		c:=a+b;
	end loop;
end;
/

5.
declare
	r number(20);
begin
	for i in 1..5 loop
		r:=dbms_random.random;
		insert into random_num values(r);
	end loop;
end;
/





6.
declare 
	r number(2);
	a number(10,2);
	v number(15,2);
begin
	for r in 1..20 loop
		a:=4*3.142*r*r;
		v:=4/3*3.142*r*r*r;
		insert into sphere values(r,a,v);
	end loop;
end;
/

7.
declare
	r sailor%rowtype;
	s_id varchar2(4); 
begin
	s_id:='&sid';
	select * into r from sailor where sid=s_id;
	dbms_output.put_line('SID= '||r.SID);
	dbms_output.put_line('SNAME= '||r.SNAME);
	dbms_output.put_line('MNAME= '||r.MNAME);
	dbms_output.put_line('SURNAME= '||r.SURNAME);
	dbms_output.put_line('RATING= '||r.RATING);
	dbms_output.put_line('AGE= '||r.AGE);

end;
/

8.
declare
	n number(10);
	i number(10):=0;
begin
	n:='&number';
	while (i<=n) loop
		dbms_output.put_line('3 X '||i||' = '||(i*3));
		i:=i+1;
	end loop;
end;
/


9.
declare
	n number(10);
begin
	n:='&number';
	for i in 0..n loop
		dbms_output.put_line('5 X '||i||' = '||(i*5));
	end loop;
end;
/

10.
declare
	basic number(20,5);
begin
	basic:='&basic_pay';
	dbms_output.put_line('total= '||(0.5*basic+0.25*basic-0.12*basic));
end;
/

11.
declare 
	str varchar2(20);
	rev varchar2(20);
	l number(2);
begin
	str:='&string';
	l:= length(str);
	for i in 1..l loop
		rev:=substr(str,i,1)||rev;
	end loop;
	dbms_output.put_line('The reverse string is: '||rev);
end;
/


12.
declare
	y number(4);
	s number(1);
begin
	y:='&year';
	if y mod 400 = 0 then	s:=1;
	elsif y mod 100 = 0 then s:=0;
	elsif y mod 4 = 0 then s:=1;
	else s:=0;
	end if;
	if s = 1 then	dbms_output.put_line('It is a leap year.');
	else dbms_output.put_line('It is not a leap year.');
	end if;
end;
/