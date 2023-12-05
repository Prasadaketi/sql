create table student.user1(
id int primary key auto_increment,
name varchar(45) not null,
email varchar(45) null,
phone int check(length(phone)=10)
);


alter table student.user1
add constraint unique_name unique(name);

alter table student.user1
add constraint chk_name_4 check(length(name)>=3);

alter table student.user1
drop check chk_name_4;

alter table student.user1
drop index unique_name;

alter table student.user1 modify name varchar(45) null;

alter table student.user1 add column subjects varchar(25);


alter table student.user1 modify subjects varchar(20);

alter table student.user1 drop column subjects;

select * from student.user1;

create table student.address1(
id int primary key auto_increment,
street varchar(45) not null,
village varchar(35) not null,
city varchar(25) not null,
state varchar(30) not null,
country varchar(15) default('india'),
userid int not null,
constraint foreign key address1_user_userid (userid) references student.user1(id)
);

create table student.user2(
id int,
name varchar(45) not null,
email varchar(50) null,
phone int check(length(phone) =10)
);



