#날짜: 2022/08/31
#이름: 장인화
#내용: SQL 연습문제2

#실습 2-1
create database `java1_Bank`;
create user 'java1_admin2'@'%' identified by '1234';
grant all privileges on `java1_bank`.* to 'java1_admin2'@'%';
flush privileges;

drop table `bank_account`;

#실습 2-2
create table `bank_customer`(
		`c_no` 		varchar(14) primary key not null,
        `c_name`	varchar(20) not null,
        `c_dist`	int default 0,
        `c_phone`	char(20) unique not null,
        `c_addr`	varchar(100)
);

create table `bank_account`(
		`a_no` 			varchar(11) primary key not null,
        `a_item_dist`	varchar(2) not null,
        `a_item_name`	varchar(20),
        `a_c_no`		varchar(14) not null,
        `a_balance`		int default 0 not null,
        `a_open_date`	date not null
);

create table `bank_transaction`(
		`t_no` 			int auto_increment primary key,
        `t_a_no`		varchar(11) not null,
        `t_dist`		int not null,
        `t_amount`		int default 0 not null,
        `t_datetime`	datetime null
);

UPDATE `bank_customer` SET `c_dist`=1 where `c_name`='김유신';
#실습 2-3
insert into `bank_customer` values('102-22-51094', '부산의원', 2, '051-518-1010', '부산시 남구');
insert into `bank_customer` values('220-82-52237', '(주)한국전산', 2, '02-134-1045', '서울시 강서구');
insert into `bank_customer` values('361-22-42687', '(주)정보산업', 2, '031-563-1253', '경기도 광명시');
insert into `bank_customer` values('730423-1000001', '김유신', 2, '010-1234-1001', '경기도 수원시');
insert into `bank_customer` values('750210-1000002', '김춘추', 1, '010-1234-1002', '경기도 광주시');
insert into `bank_customer` values('830513-2000003', '선덕여왕', 1, '010-1234-1003', '서울시 마포구');
insert into `bank_customer` values('870830-1000004', '강감찬', 1, '010-1234-1004', '서울시 영등포구');
insert into `bank_customer` values('910912-2000005', '신사임당', 1, '010-1234-1005', '강원도 강릉시');
insert into `bank_customer` values('941127-1000006', '이순신', 1, '010-1234-1006', '부산시 영도구');

insert into `bank_account` values('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 420000,'2005-07-21');
insert into `bank_account` values('101-11-1003', 'S1', '자유저축예금', '870830-1000004', 53000,'2007-02-17');
insert into `bank_account` values('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000,'2003-04-14');
insert into `bank_account` values('101-11-2002', 'S1', '자유저축예금', '361-22-42687', 4201000,'2008-12-30');
insert into `bank_account` values('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010,'2010-06-07');
insert into `bank_account` values('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000,'2011-05-13');
insert into `bank_account` values('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800,'2012-10-15');
insert into `bank_account` values('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500,'2009-08-25');
insert into `bank_account` values('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000,'2013-12-11');
insert into `bank_account` values('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000,'2020-09-23');


insert into `bank_transaction` values( 1, '101-11-1001', 1, 50000, now());
insert into `bank_transaction` values( 2, '101-11-1003', 2, 120000, now());
insert into `bank_transaction` values( 3, '101-11-2001', 2, 300000, now());
insert into `bank_transaction` values( 4, '101-12-1002', 1, 1000000, now());
insert into `bank_transaction` values( 5, '101-13-1001', 3, 0, now());
insert into `bank_transaction` values( 6, '101-11-1005', 1, 200000, now());
insert into `bank_transaction` values( 7, '101-11-1001', 1, 450000, now());
insert into `bank_transaction` values( 8, '101-11-2002', 2, 32000, now());
insert into `bank_transaction` values( 9, '101-11-2003', 3, 0, now());
insert into `bank_transaction` values( 10, '101-11-1003', 1, 75000, now());

#실습 2-4
select * from `bank_account`;

#실습 2-5
select * from `bank_customer`;

#실습 2-6
select * from `bank_transaction`;

#실습 2-7
select `c_name`,`c_no` from `bank_customer`;

#실습 2-8
select `a_item_dist`, `a_item_name` from `bank_account`;

#실습 2-9
select distinct `a_item_dist`, `a_item_name` from  `bank_account`;

#실습 2-10
SELECT * FROM `bank_account` WHERE `a_item_name`='자유저축예금' and `a_balance`>=1000000;

#실습 2-11
 SELECT * FROM `bank_customer` WHERE `c_addr` Like '경기도 ___';

#실습 2-12
SELECT * FROM `bank_customer` WHERE `c_dist` = 2;

#실습 2-13
SELECT * FROM `bank_transaction` WHERE `t_dist` = 1;

#실습 2-14
SELECT * FROM `bank_transaction` WHERE `t_dist` = 2 order by `t_amount` desc;

#실습 2-15
select 
	sum(`t_amount`) as '입금총합',
    avg(`t_amount`) as '입금평균'
    FROM `bank_transaction` 
	WHERE `t_dist`=1;

#실습 2-16
	select
    max(`t_amount`) as '큰 금액',
    min(`t_amount`) as '작은 금액'
    FROM `bank_transaction` 
	WHERE `t_dist`=2;


#실습 2-17
SELECT * FROM `bank_account` WHERE `a_item_name` like '자유저축예금' order by `a_balance` desc ;

#실습 2-18
SELECT * FROM `bank_account` WHERE `a_item_name` like '자유저축예금'
ORDER BY `a_balance` desc
limit 1;

#실습 2-19
SELECT * FROM `bank_transaction` WHERE `t_dist` <> 3
ORDER BY `t_dist`, `t_amount` DESC;


#실습 2-20
select 
	count(if(`t_dist`=1,1,null))as `입금 건수`,
    count(if(`t_dist`=2,1,null))as `출금 건수`,
    count(if(`t_dist`=3,1,null))as `조회 건수`
 FROM `bank_transaction`;   

#실습 2-21
SELECT 
`t_dist`,
CASE
	when(`t_dist`=1) then '입금'
    when(`t_dist`=2) then '출금'
    when(`t_dist`=3) then '조회'
 END AS 'type',   
`t_a_no`,
`t_amount`
FROM `bank_transaction`;


#실습 2-22
SELECT t_dist, COUNT(`t_no`) FROM `bank_transaction` GROUP BY `t_dist`;

#실습 2-23
SELECT `t_a_no`, `t_dist`, SUM(`t_amount`) FROM `bank_transaction`
WHERE `t_dist` = 1
GROUP BY `t_a_no`;

#실습 2-24
SELECT 
`t_a_no`, 
`t_dist`,
SUM(`t_amount`) AS `합계` 
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`
having `합계` > 100000
order by `합계` desc;

#실습 2-25
SELECT * FROM `bank_account` AS a
join `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-26
SELECT  
	`a_no` as `계좌번호`,
    `a_item_name` as `계좌이름`,
    `a_c_no` as `주민번호(사업자번호)`,
    `c_name` as `고객명`,
    `a_balance` as `현재잔액`
FROM `bank_account` AS a
join `bank_customer` as b
on a.a_c_no = b.c_no;

#실습 2-27
select * from `bank_transaction` as a
join `bank_account` as b
on a.t_a_no = b.a_no;


#실습 2-28
SELECT 
	`t_no` AS `거래번호`,
	`t_a_no` AS `계좌번호`,
	`a_c_no` AS `고객번호(주민번호)`,
	`t_dist` AS `거래구분`,
	`t_amount` AS `거래금액`,
	`t_datetime` AS `거래일자`
FROM `bank_account` AS a
JOIN `bank_transaction` AS b
ON a.a_no = b.t_a_no;


#실습 2-29
select 
`t_no`,
`a_no`,
`c_no`,
`t_dist`,
`a_item_name`,
`c_name`,
`t_amount`,
`t_datetime`
from `bank_transaction` as a
join `bank_account` as b on a.t_a_no = b.a_no
join `bank_customer` as c on b.a_c_no = c.c_no
where a.t_dist = 1
order by `t_amount` desc;


#실습 2-30
select 
`t_no`,
`a_no`,
`c_no`,
`t_dist`,
`a_item_name`,
 count(`c_no`)as `거래건수` from `bank_transaction` as a
join  `bank_account` as b on a.t_a_no =b.a_no
join `bank_customer` as c on b.a_c_no = c.c_no
where `t_dist` in(1,2) and `c_dist`=1
group by `c_no`
order by `t_dist` asc, `거래건수` desc;




