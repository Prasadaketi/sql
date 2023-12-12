use realestate;

create table realestate.propertytype(
id int primary key auto_increment,
type varchar(55) not null,
description varchar(100) not null
);

insert into realestate.propertytype(type, description) values ('apartment', 'The apartment consists of a large bright bedroom with a comfy king-sized bed');
insert into realestate.propertytype(type, description) values ('apartment', ' It is the perfect place to stay for couples looking for a romantic location in the historic centre');


create table realestate.property(
id int primary key auto_increment,
name varchar(45) not null,
dimensions varchar(75) not null,
propertyid int not null,
constraint fk_property_propertytype_properid foreign key (propertyid) references realestate.propertytype(id)
);


insert into realestate.property (name, dimensions, propertyid)values('mlysn twnship', '1500sqft', 1);
insert into realestate.property (name, dimensions, propertyid)values('one city', '2500sqft', 2);


create table realestate.address(
id int primary key auto_increment,
street varchar(55) not null,
landmark varchar(45),
state varchar(45),
country varchar(45),
pincode int
);

insert into realestate.address(id, street, landmark, state, country, pincode)values(1, '5thphase', 'damart', 'ts', 'ind', '500001');
insert into realestate.address(id, street, landmark, state, country, pincode)values(2, '5thphase', 'nexusmall', 'ts', 'ind', '500001');


create table realestate.addressmapping(
id int primary key auto_increment,
propertyid int,
addressid int,
constraint fk_addressmapping_property_propertyid foreign key(propertyid) references  realestate.property(id),
constraint fk_addressmapping_address_addressid foreign key(addressid) references  realestate.address(id)
);

insert into realestate.addressmapping(propertyid,addressid)values(1,1);
insert into realestate.addressmapping(propertyid,addressid)values(2,2);

select * from realestate.propertytype as pt join realestate.property as prp on pt.id = prp.propertyid;
select * from realestate.property as prp join realestate.addressmapping as am on prp.id = am.propertyid;
select * from realestate.address as adrs join realestate.addressmapping as am on adrs.id = am.addressid;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_propertydetails`()
BEGIN
select * from realestate.propertytype as pt 
join  realestate.property as p on pt.id = p.propertyid
join  realestate.addressmapping as am on p.id = am.propertyid;
END$$
DELIMITER ;

call get_propertydetails;

select * from propertytype;

call save_propertytype(9,'hostel','adv');

DELIMITER $$
USE `realastatemgt`$$
CREATE PROCEDURE `update_propertytype` (propertytypeid int,propertytype varchar(25),propertydescription varchar(250))
BEGIN
update propertytype set type=propertytype,description=propertydescription where id=propertytypeid ;
END$$

DELIMITER ;

update propertytype set type='villa' where id =9;

delete from propertytype where id=9;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_property`()
BEGIN
select * from realastatemgt.propertytype as pt 
join  realastatemgt.property as p on pt.id = p.propertyid
join  realastatemgt.addressmapping as am on p.id = am.propertyid;
END$$
DELIMITER ;


call save_property(3,3,'hostel3','50 sqft');