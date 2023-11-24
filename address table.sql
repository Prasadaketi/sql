insert into address.user(dno, street, city, district, state, country, continent)values(590, 'abc', 'palakol', 'westgodavari', 'ap', 'india', 'asia');
select * from address.user;
update address.user set street='abc' where dno=590;
delete from address.user where state='ap';
      