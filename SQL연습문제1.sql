#날짜 : 2022/08/29
#이름 : 장인화
#내용 : SQL연습문제

#실습 1-1
create database `Java1_shop`;
create user 'java1_admin1'@'%' identified by '1234';
grant all privileges on `java1_shop`.* to 'java1_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
	`custid` varchar(10)  	primary key not null,
    `name`	 varchar(10)  	not null,
    `hp`	 	char(13)  	default null,	
    `addr`	 varchar(100)   default null,
    `rdate`  date not null
);


create table `Product`(
	`prodNo` 	int auto_increment primary key,
    `prodName`	varchar(10) not null,
    `stock`	 	int default 0 ,	
    `price`	 	int default null,
    `company`   varchar(20) not null
);

create table `Order`(
	`orderNo` 		int auto_increment primary key,
    `orderid`		varchar(10) not null,
    `orderProduct`	int not null ,	
    `ordercount`	int default 1,
    `orderDate`   	datetime not null
);



#실습 1-3
insert into `customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `customer` values ('c103', '장보고', '010-1234-1003', '완도군 정산면', '2022-01-03');
insert into `customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `customer` (`custid`, `name`, `rdate`) values ('c105', '이성계','2022-01-05');
insert into `customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `customer` (`custid`, `name`, `rdate`) values ('c107', '허준', '2022-01-07');
insert into `customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');


insert into `product` values (1, '새우깡', 5000, 1200, '농심');
insert into `product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `product` values (4, '양파링', 1250, 1800, '농심');
insert into `product` (`prodNo`, `prodName`, `stock`, `company`) values (5, '조리퐁', 2200, '크라운');
insert into `product` values (6, '마가렛트', 3500, 3500, '롯데');
insert into `product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `order` values (1, 'c102', 3, 2, '2022-07-01 13:15:10');
insert into `order` values (2, 'c101', 4, 1, '2022-07-01 14:16:11');
insert into `order` values (3, 'c108', 1, 1, '2022-07-01 17:23:18');
insert into `order` values (4, 'c109', 6, 5, '2022-07-02 10:46:36');
insert into `order` values (5, 'c102', 2, 1, '2022-07-03 09:15:37');
insert into `order` values (6, 'c101', 7, 3, '2022-07-03 12:35:12');
insert into `order` values (7, 'c110', 1, 2, '2022-07-03 16:55:36');
insert into `order` values (8, 'c104', 2, 4, '2022-07-04 14:23:23');
insert into `order` values (9, 'c102', 1, 3, '2022-07-04 21:54:34');
insert into `order` values (10, 'c107', 6, 1, '2022-07-05 14:21:03');

#실습 1-4
select * from `customer`;

#실습 1-5
select `custid`,`name`, `hp` from `customer`;

#실습 1-6
select * from `product`;

#실습 1-7
select `company` from `product`;

#실습 1-8
select distinct `company` from `product`;

#실습 1-9
select `prodName`, `price` from `product`;

#실습 1-10
select `prodName`,`price`+500 as `조정단가` from `product`;

#실습 1-11
select `prodName`, `stock`, `price` from `product` where `company` = '오리온';

#실습 1-12
select `orderproduct`, `ordercount`, `orderdate` from `order` where `orderid`= 'c102';

#실습 1-13
SELECT `orderProduct`, `orderCount`, `orderDate` FROM `Order` 
where `orderid`= 'c102' and `ordercount`>=2;

#실습 1-14
SELECT * FROM `Product` WHERE `price`>=1000 and `price` <=2000;

#실습 1-15
SELECT `custid`, `name`, `hp`, `addr` FROM `Customer` 
where `name` like '김__';

#실습 1-16
SELECT `custid`, `name`, `hp`, `addr` FROM `Customer` 
where `name` like '__';

#실습 1-17
SELECT * FROM `Customer` WHERE `hp` is null ;

#실습 1-18
SELECT * FROM `Customer` WHERE `addr` is not null;

#실습 1-19
SELECT * FROM `Customer` order by `rdate` desc;

#실습 1-20
SELECT * FROM `Order` WHERE `orderCount` >= 3 
order by `ordercount` desc, `orderNo` asc;

#실습 1-21
select avg(price) from `product`;

#실습 1-22
select sum(stock) as `재고량 합계` FROM `Product` WHERE `company`='농심';

#실습 1-23
select count(*) AS `고객수` FROM `Customer`;

#실습 1-24
select count(distinct `company` ) AS `제조업체 수` FROM `Product` ;

#실습 1-25
SELECT `orderProduct` AS `주문 상품번호`, 
	SUM(`orderCount`) AS `총 주문수량` 
    FROM `Order`
    group by `orderproduct`;
    

#실습 1-26
SELECT `company` AS `제조업체`, 
		COUNT(*) AS `제품수`, 
        MAX(`price`) AS `최고가` 
        FROM `Product`
        group by `company`;

#실습 1-27
SELECT `company` AS `제조업체`, 
		COUNT(*) AS `제품수`,
        MAX(`price`) AS `최고가` 
        FROM `Product` 
        GROUP BY `company`
        having `제품수` >= 2;

#실습 1-28
SELECT `orderProduct`, 
		`orderId`, 
        SUM(`orderCount`) AS `총 주문수량` 
        FROM `Order`
        group by `orderproduct`;
		
        
        
#실습 1-29
SELECT a.orderId, b.prodName FROM `Order` AS a
join `product` as b
on	 a.`orderproduct` = b.`prodNo`
where `orderid` = 'c102';


#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.custId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE substr( `orderdate`, 1, 10) = '2022-07-03';
