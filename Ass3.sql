
Day6:
-----------------------------------------------------------------------------------------------------
create table sailor(
	sid varchar2(4),
	sname varchar2(15),
	mname varchar2(15),
	Surname varchar2(15),
	Rating number(2),
	Age number(3,1)
); 

alter table sailor add constraint sailor_pk primary key(sid);
alter table sailor add constraint sailor_start check(sid like 's%'); 
alter table sailor add constraint name_initcap check(sname=initcap(sname));

INSERT INTO SAILOR VALUES('&SID', '&SNAME', '&MNAME', '&SURNAME', '&RATING', '&AGE');




create table boat(
	bid number(3),
	bname varchar2(10),
	color varchar2(6)
);

alter table boat add constraint boat_pk primary key(bid);
alter table boat add constraint bn_low  check(bname=lower(bname));
alter table boat add constraint color_fxd check(color in ('red', 'green', 'blue'));

INSERT INTO BOAT VALUES('&BID', '&BNAME', '&COLOR');



create table reserve(
	sid varchar2(4),
	bid number(3),
	day date
);

ALTER TABLE RESERVE ADD CONSTRAINT SID_FK FOREIGN KEY(SID) REFERENCES SAILOR(SID);
ALTER TABLE RESERVE ADD CONSTRAINT BID_FK FOREIGN KEY(BID) REFERENCES BOAT(BID);
ALTER TABLE RESERVE ADD CONSTRAINT DATE_CK CHECK(DAY<'01-JAN-2000');
ALTER TABLE RESERVE ADD CONSTRAINT ALL_PK PRIMARY KEY(SID,BID);



INSERT INTO RESERVE VALUES('&SID', '&BID', '&R_DAY');




Day 7
-----------------------------------------------------------------------------------------------
1. select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) name, age from sailor;
2. select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) name_of_sailors, age+2 from sailor;
3. select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) name_of_sailors from sailor order by concat(concat(sname, ' '), concat(concat(mname, ' '), surname));
4. select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_name from sailor;
5. select distinct(sname) from sailor;
6. select distinct(sname), rating from sailor where rating>=5 and rating<=10;
7. select * from sailor order by rating, age desc;
8. select * from sailor where rating>7;
9. select * from sailor where sname='Horatio' and age=35.4;
10.select * from sailor where sname='Horatio' or age=35.4;
11.select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_reserve_boat_104 from sailor s NATURAL JOIN reserve r where  bid=104; 
12.select sid sailor_reserve_boat_RED from reserve r NATURAL JOIN boat b where color='red';
13.select * from sailor where sname like 'B%';
14.select * from sailor where concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) like '%B%' or  concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) like '%b%';
15.select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_with_mid_name from sailor where mname is not null;
16.select concat(concat(sname, ' '), surname) sailor_with_mid_name from sailor where mname is null;
17.select distinct(color) Lubber_boat_color from boat NATURAL JOIN reserve NATURAL JOIN sailor where sname='Lubber';
18.select distinct(concat(concat(sname, ' '), concat(concat(mname, ' '), surname))) sailor_with_boat from sailor s, reserve r where r.sid=s.sid; ORRR
   select sid from sailor where sid in(select sid from reserve); ORRR
   select sname from sailor where exits(select * from reserve where sailor.sid=resere.sid);

20.select distinct(s.sid), rating+1 incremented_rating from sailor s, reserve r1, reserve r2 where s.sid=r1.sid and s.sid=r2.sid and r1.bid<>r2.bid and r1.day=r2.day;
21.select sname from sailor where sname like 'B_%b';
22.select sname from sailor where sname like 'B_b';
23.select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_with_red_green_boat from sailor NATURAL JOIN reserve NATURAL JOIN boat where color='red' or color='green';
24.select sid, concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_with_red_not_green_boat from sailor NATURAL JOIN reserve NATURAL JOIN boat where color='red' 
minus 
select sid, concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_with_red_not_green_boat from sailor NATURAL JOIN reserve NATURAL JOIN boat where  color='green';

25.select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) sailor_with_boat_103 from sailor s, reserve r where s.sid=r.sid and bid=103;
26.select distinct(concat(concat(sname, ' '), concat(concat(mname, ' '), surname))) sailor_with_boat_RED from sailor NATURAL JOIN reserve NATURAL JOIN boat where color='red';
28.select distinct(concat(concat(sname, ' '), concat(concat(mname, ' '), surname))) sailor_with_boat_not_RED from sailor NATURAL JOIN reserve NATURAL JOIN boat
   minus
   select concat(concat(sname, ' '), concat(concat(mname, ' '), surname)) from sailor NATURAL JOIN reserve NATURAL JOIN boat where color='red';
29.select count(distinct(sname || ' ' || mname || ' ' || surname)) distinct_sailor from sailor;
30.
	a. select * from sailor where rating > some(select rating from sailor where sname='Horatio');
	b. select * from sailor where rating > all(select rating from sailor where sname='Horatio');
32.select * from sailor minus select * from sailor where sname='Lubber' or sname='Horatio';
33.select sname || ' ' || mname || ' ' || surname name from sailor where rating>any(7,8,9);
34.select sname || ' ' || mname || ' ' || surname name from sailor where rating>all(7,8,9);
35.select avg(age) from sailor where rating=10;
36.select sname || ' ' || mname || ' ' || surname age_sailor_greater_than_10 from sailor where age>(select max(age) from sailor where rating=10);
37.select rating,min(age) from sailor group by rating;
38.select rating, count(*) from sailor where age>17 group by rating;
89.select rating, min(age) from sailor where age>17 group by rating having count(*)>1;
40.select rating, avg(age) from sailor group by rating having count(*)>1;
41.select boat.bid, count(*) from reserve, boat where reserve.bid=boat.bid and color='red' group by boat.bid;
42.select * from sailor where rating=(select max(rating) from sailor);    OR
   select * from sailor where rating>=all(select rating from sailor);
44.select rating from sailor group by rating having avg(age)<=all(select avg(age) from sailor group by rating);
45.select * from sailor where not exists((select bid from boat) MINUS (select bid from reserve where sailor.sid=reserve.sid));
