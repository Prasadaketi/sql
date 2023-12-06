create table productdetails.products(
  id int primary key auto_increment,
  name varchar(45) not null,
  price varchar(40) not null,
  discount varchar(25) not null
);


alter table productdetails.products  add column validity varchar(10);

alter table productdetails.products modify validity varchar(5);

alter table productdetails.products drop column price;


#alter table add constraint:
#add null constraint:
alter table productdetails.products modify name varchar(50) null;

#add not null
alter table productdetails.products modify name varchar(50)  not null;

#add unique constraint:
alter table productdetails.products add constraint unique_id unique(id);

#drop unique constraint:
alter table productdetails.products  drop index unique_id;

#check constraint:
alter table productdetails.products add constraint chk_name_4 check(length(name)>=4);

#drop check constraint:

alter table productdetails.products drop check chk_name_4;

insert into productdetails.products(id, name, discount, validity) values(1, 'asus', '50', '5');

select * from productdetails.products;
create table productdetails.productspecs(
  id int primary key auto_increment,
  review varchar(40) not null,
  expiredate int  not null,
  physicalstate varchar(40) not null,
  userid int not null,
  constraint foreign key productspecs_user_userid(userid) references productdetails.products(id)
);


select * from productdetails.productspecs;





select * from productdetails.products as prod join productdetails.productspecs  as prodspcs on prod.id = prodspcs.userid;

select * from productdetails.products as prod left join productdetails.productspecs  as prodspcs on prod.id = prodspcs.userid;

select * from productdetails.products as prod right join productdetails.productspecs  as prodspcs on prod.id = prodspcs.userid;