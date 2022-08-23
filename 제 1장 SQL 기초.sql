+# 날짜 : 2022/08/22
# 이름: 장인화
# 내용: 제1장 SQL 기초alter

#실습 1-1
CREATE DATABASE `UserDB`;
DROP DATABASE `UserDB`;

#실습 1-2
CREATE TABLE `User1` (
	`uid`  VARCHAR(10),
	`name` VARCHAR(10),
	`hp`   CHAR(13),
    `age`  INT
);

DROP TABLE `User1`;

#실습 1-3
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬' , 45);
INSERT INTO `User1` SET 
						`uid`='A105',
						`name`='이순신',
                        `hp`='010-1234-5555';
                        
                        
#실습 1-4
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30; 
SELECT `uid`, `name`, `age` FROM `User1`;

#실습 1-5
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`='51' WHERE `uid`='A105';
UPDATE `User1` SET 
					`hp`= '010-1234-1001',
                    `age`= 27
			   WHERE
					`uid`= 'A101';

#실습 1-6
delete from `User1` where `uid`='A101';
delete from `User1` where `uid`='A102' AND `age`=25;
delete from `User1` where `age` >=30;

#실습 1-7
	create table `TblUser` (
		`userId`	varchar(10),
		`userName` 	varchar(10),
        `userHP`	char(13),
        `userAge`	tinyint,
        `userAddr`	varchar(20)
    );
    
    create table `TblProduct`(
		`prdcode`		int,
        `prdName` 		varchar(10),
        `prdPrice`		int,
        `prdAmount`		int,
        `prdCompany`	varchar(10),
		`prdMakedate`	date
    );
    

#실습 1-8
insert into `TblUser` values ('p101', '김유신', '010-1234-1001', 25, '서울시 중구');
insert into `TblUser` values ('p102', '김춘추', '010-1234-1002', 23, '부산시 금정구');
insert into `TblUser` (`userId`, `userName`, `userAge`, `userAddr`) values ('p103', '장보고', 31, '경기도 광주군');
insert into `TblUser` (`userId`, `userName`, `userAddr`) values ('p104', '강감찬', '경남창원시');
insert into `TblUser` set
						`userId`	='p105', 
						`userName`	='이순신', 
						`userHP`	='010-1234-1005', 
						`userAge`	='50';
                        
insert into `TblProduct` values ('1', '냉장고', 800, 10, 'LG', '2022-01-06');
insert into `TblProduct` values ('2', '노트북', 1200, 20, '삼성', '2022-01-06');
insert into `TblProduct` values ('3', 'TV', 1400, 6, 'LG', '2022-01-06');
insert into `TblProduct` values ('4', '세탁기', 1000, 8, 'LG', '2022-01-06');
insert into `TblProduct` (`prdCode`, `prdName`, `prdPrice`, `prdAmount`) values(5, '컴퓨터',1100 , 0);
insert into `TblProduct` set
						`prdCode` 	= '6',
                        `prdName` 	= '휴대폰',
                        `prdPrice` 	= 900,
                        `prdAmount` = 102,
                        `prdCompany` = '삼성',
                        `prdMakeDate` = '2022-01-06';



#실습 1-9