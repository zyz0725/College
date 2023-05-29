drop table ems_ssm cascade constraint;
drop sequence ems_ssm_seq;
create sequence ems_ssm_seq start with 1; 
create table ems_ssm(
	id number(12) primary key,
	name varchar2(20) not null,
	salary number(12,2),
	married char(1) check(married in('0','1')),
	did number(6) references ems_dept(did)
);
insert into ems_ssm values(ems_ssm_seq.nextval,'liuyi',2500,'1',1);
insert into ems_ssm values(ems_ssm_seq.nextval,'chener',3000,'0',6);
insert into ems_ssm values(ems_ssm_seq.nextval,'zhangsan',3500,'1',4);
insert into ems_ssm values(ems_ssm_seq.nextval,'lisi',4000,'1',2);
insert into ems_ssm values(ems_ssm_seq.nextval,'wangwu',5000,'0',4);
insert into ems_ssm values(ems_ssm_seq.nextval,'zhaoliu',4500,'1',1);
insert into ems_ssm values(ems_ssm_seq.nextval,'sunqi',3200,'0',6);
insert into ems_ssm values(ems_ssm_seq.nextval,'zhouba',5500,'1',4);
insert into ems_ssm values(ems_ssm_seq.nextval,'wujiu',6000,'1',2);
insert into ems_ssm values(ems_ssm_seq.nextval,'zhengshi',2000,'0',3);
select * from ems_ssm;

drop table dept_ssm cascade constraint;
drop sequence dept_ssm_seq;
create sequence dept_ssm_seq start with 1;
create table dept_ssm(
	did number(6) primary key,
	deptname varchar2(20) unique
);
insert into dept_ssm values(dept_ssm_seq.nextval,'回家部');
insert into dept_ssm values(dept_ssm_seq.nextval,'开发部');
insert into dept_ssm values(dept_ssm_seq.nextval,'营业部');
insert into dept_ssm values(dept_ssm_seq.nextval,'市场部');
insert into dept_ssm values(dept_ssm_seq.nextval,'人事部');
insert into dept_ssm values(dept_ssm_seq.nextval,'外交部');
select * from dept_ssm;


drop table ems_manager cascade constraint;
create table ems_manager(
	username varchar2(20) primary key,
	password varchar2(50) not null
);
select * from ems_manager;
insert into ems_manager values('zyz','951207');