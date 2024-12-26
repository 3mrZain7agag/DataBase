drop database delivery_system;
create database Delivery_System;
use Delivery_System;

create table Customer(
	ID int primary key auto_increment,
    CName varchar(20) not null,
    CAddress varchar(50) not null
    );
    
create table Delivery(
	SSN int primary key,
    DName varchar(20) not null,
    vehicle varchar(20) not null
    );

create table Restaurant(
	TC int primary key,
    RName varchar(30) not null,
    RAddress varchar(50) not null
    );
    
create table Menus(
	Item_ID int,
    IName varchar(30) not null,
    Price int not null,
    RES_TC int,
    primary key(Item_ID,RES_TC),
    foreign key(RES_TC)references restaurant(TC)
    );
create table `order`(
	order_ID int primary key auto_increment,
    Statue varchar(15),
    ODate datetime not null,
    Cost int not null,
    payment varchar(20) not null,
    DSSN int not null,
    foreign key(DSSN)references delivery(SSN),
    CID int not null,
    foreign key(CID)references customer(ID)
    );
    
-- select * from `order`;
    
create table order_items (
    order_ID INT,
    item_ID INT,
    FOREIGN KEY (order_ID) REFERENCES `order`(order_ID),
    FOREIGN KEY (item_ID) REFERENCES Menus(Item_ID)
);
    
insert into Restaurant (RName,TC, RAddress)
values 
    ("Elminoufy",7530,"minuf"),
    ("Elz3eem",1280,"sheben"),
    ("3mar",4960,"minuf");
    
-- select * from Restaurant

insert into Menus (Item_ID,IName, Price, RES_TC)
VALUES 
    (1,"Fool",5, 7530),
    (2,"Ta3meya",5, 7530),
    (3,"Gebna",5, 7530),
    (4,"Btates",15,7530),
    (5,"Merba",10,7530),
    (1,"Koshary_So3'yar",20, 1280),
    (2,"Koshary Wsat",30, 1280),
    (3,"Koshary Large",45, 1280),
    (1,"Shawerma",70,4960),
    (2,"Ftta",50, 4960),
    (3,"Kebda",30, 4960),
    (4,"Coke",18, 4960);
    

-- select IName,Price from Menu-- s where RES_TC=1280

insert into Delivery (SSN,DName,vehicle)
VALUES
	(2004,"Zain","car"),
    (27,"Hagag","toktok"),
	(224,"Amr","moto");

-- select * from delivery

-- select * from `order`