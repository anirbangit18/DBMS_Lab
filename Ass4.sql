
Day 10
-------------------------------------------------------------------------------------
create table traveller(ID number(3), Name varchar2(20), location varchar2(20));
create table tour(Tour_Id varchar2(2), Tour_spot varchar2(10), fare number(10), type varchar2(10));
insert into traveller values('&Id','&name','&loc');
create sequence seq1 start with 108 increment by -1 maxvalue 108;
insert into traveller values(seq1.nextval, '&name', '&loc'); 

drop sequence seq1;
create sequence seq2 start with 1 increment by 1 minvalue 1;
insert into tour values('T'||seq2.nextval,'&tour_spot','&fare','&type');

select seq1.currval from dual;  -- to check current value

update tour set tour_id='&tourid' where tour_id='&tour_id';
update tour set type='Delux' where tour_id='T5';

1. create view tourview as  select tour_spot tour_spotname, fare fares from tour where type='Delux'; 
drop view tourview;

2. select tour_spot from tour where fare>8000 and type='Delux';
   select tour_spotname from tourview where fares>8000;

3. insert into tourview values('&tourspot','&fare');
   update tour set type='Delux' where type is null;
4.

5.

6. create view tour_type_num as select type tour_type, count(*) count from tour group by type;






