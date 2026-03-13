create database schoolA;
use schoolA;

create table std_details(
id int primary key,
std_name varchar(200) not null,
std_email varchar(400) unique,
std_dob date not null,
std_age int check(std_age>=17),
std_gen varchar(50) check (std_gen in('m','f')),
std_sub int 
);
select * from std_details;


create table sub_details(sub_id int primary key,
sub_name varchar(200)
);

alter table std_details
add constraint fk_std_sub
foreign key(std_sub) references sub_details(sub_id);

insert into sub_details (sub_id,sub_name)
values
(1,"maths"),
(2,"science"),
(3,"computer science"),
(4,"arts"),
(5,"economics");

select * from sub_details;

INSERT INTO std_details(id,std_name,std_email,std_dob,std_age,std_gen,std_sub) VALUES 
(1,"alan","alan@gmail.com",'2001-01-01',23,"M",1),
(2,"amal","amal@gmail.com",'2001-02-01',23,"M",2),
(3,"anju","anju@gmail.com",'2000-01-13',24,"F",3),
(4,"achu","achu@gmail.com",'2002-10-01',22,"F",4),
(5,"joy","joy@gmail.com",'2003-12-01',21,"M",5),
(6,"alan","alanjoy@gmail.com",'2001-01-01',18,"M",1);

update std_details
set std_name="joyalan",std_email="joyalan@gmail.com"
where id=5;

delete from std_details
where id=6;