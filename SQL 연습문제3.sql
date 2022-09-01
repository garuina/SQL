# 날짜 : 2022-09-01
# 이름 : 장인화
# 내용 : SQL연습문제 3

#실습 3-1
create database `College`;
create user 'java1_admin3'@'%' identified by '1234';
grant all privileges on College.* to 'java1_admin3'@'%';
flush privileges;

drop table `register`;
update `student` set `stdNo` = '20201126' where `stdName` = '김춘추';

#실습 3-2
create table `student`(
	`stdNo`			char(8) primary key ,
	`stdName`		varchar(20) not null,
    `stdHP`			varchar(13) unique not null,
    `stdYear`		tinyint not null,
    `stdAddress`	varchar(100)
);

create table `lecture`(
	`lecNo`			int primary key not null,
	`lecName`		varchar(20) not null,
    `lecCredit`		tinyint not null,
    `lecTime`		int not null,
    `lecClass`		varchar(10) default null
);

create table `register`(
	`regStdNo`			char(8) not null,
	`regLecNo`			int(5) not null,
    `regMIdScore`		tinyint,
    `regFinalScore`		tinyint,
    `regTotalScore`		tinyint,
    `regGrade`			char(1)
);

#실습 3-3
insert into `student` (`stdNo`, `stdName`, `stdHP`, `stdYear`)values (20201016, '김유신', '010-1234-1001', 3);
insert into `student` values ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시' );
insert into `student` values ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `student` values ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `student` values ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `student` values ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `lecture` values (159,'인지행동심리학',3 ,40 , '본304');
insert into `lecture` values (167,'운영체제론',3 ,25 , '본805');
insert into `lecture` values (234 ,'중급영문법',3 ,20 , '본201');
insert into `lecture` values (239,'세법개론',3 ,40 , '본204');
insert into `lecture` values (248,'빅데이터 개론',3 ,20 , '본801');
insert into `lecture` values (253,'컴퓨팅사고와 코딩',2 ,10 , '본802');
insert into `lecture` values (349,'사회복지 마케팅',2 ,50 , '본301');

insert into `register` (`regStdNo`, `regLecNo`) values ('20201126', 234);
insert into `register` (`regStdNo`, `regLecNo`) values ('20201016', 248);
insert into `register` (`regStdNo`, `regLecNo`) values ('20201016', 253);
insert into `register` (`regStdNo`, `regLecNo`) values ('20201126', 239);
insert into `register` (`regStdNo`, `regLecNo`) values ('20210216', 349);
insert into `register` (`regStdNo`, `regLecNo`) values ('20210326', 349);
insert into `register` (`regStdNo`, `regLecNo`) values ('20201016', 167);
insert into `register` (`regStdNo`, `regLecNo`) values ('20220416', 349);

#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdYear` = 3;

#실습 3-8
select * from `lecture` where `lecCredit` = 2; 

#실습 3-9
update `register` set `regMidScore` = 36, `regFinalScore`= 42 WHERE 
`regStdNo`='20201126' AND `regLecNo`=234;
update `register` set`regMidScore` = 24, `regFinalScore`= 62 WHERE 
`regStdNo`='20201016' AND `regLecNo`=248;
update `register` set`regMidScore` = 28, `regFinalScore`= 40 WHERE 
`regStdNo`='20201016' AND `regLecNo`=253;
update `register` set`regMidScore` = 37, `regFinalScore`= 57 WHERE 
`regStdNo`='20201126' AND `regLecNo`=239;
update `register` set`regMidScore` = 28, `regFinalScore`= 68 WHERE 
`regStdNo`='20210216' AND `regLecNo`=349;
update `register` set`regMidScore` = 16, `regFinalScore`= 65 WHERE 
`regStdNo`='20210326' AND `regLecNo`=349;
update `register` set`regMidScore` = 18, `regFinalScore`= 38 WHERE 
`regStdNo`='20201016' AND `regLecNo`=167;
update `register` set`regMidScore` = 25, `regFinalScore`= 58 WHERE 
`regStdNo`='20220416' AND `regLecNo`=349;
SELECT * FROM `Register`;

#실습 3-10
update `register` set 
				`regTotalScore`= `regMidScore` + `regFinalScore`,
				`regGrade` = if(`regTotalScore` >= 90, 'A', 
				if(`regTotalScore` >= 80, 'B',
				if(`regTotalScore` >= 70, 'C',
				if(`regTotalScore` >= 60, 'D', 'F'))));

#실습 3-11
SELECT * FROM `Register` order by `regTotalScore` desc;

#실습 3-12
SELECT * FROM `Register` where `regLecNo`=349 order by `regTotalScore` desc;

#실습 3-13
SELECT * FROM `Lecture`  where `lectime`>=30;

#실습 3-14
SELECT `lecName`,`lecClass` from `lecture`;

#실습 3-15
select `stdNo`, `stdName` from `student`;
 
#실습 3-16
SELECT * FROM `Student` where `stdAddress` is null;

#실습 3-17
SELECT * FROM `Student` where `stdAddress` like '부산%';

#실습 3-18
select * from `student` as a left join `Register` AS b ON a.stdNo = b.regStdNo;

#실습 3-19
select 
	`stdNo`,
    `stdName`,
    `reglecno`,
    `regmidscore`,
    `regfinalscore`,
    `regtotalscore`,
    `reggrade` 
from `Student` AS a, `Register` AS b WHERE a.stdNo = b.regStdNo;

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo` 
FROM `Student` AS a 
JOIN `Register` AS b on a.stdno = b.regstdno
where  b.`reglecno` = 349;

#실습 3-21
SELECT
`stdNo`,
`stdName`,
COUNT(`stdNo`) AS `수강신청 건수`,
SUM(`regTotalScore`) AS `종합점수`,
SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b 
ON a.stdNo = b.regStdNo
group by `stdNo` order by `수강신청 건수` desc;


#실습 3-22
SELECT * FROM 
`Register` AS a
join
`lecture` as b
on a.reglecno = b.lecno;

#실습 3-23
SELECT 
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `Register` AS a join `lecture` as b
on a.reglecno = b.lecno;

#실습 3-24
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b ON a.reglecno = b.lecno
where `lecname` = '사회복지 마케팅';

#실습 3-25
SELECT 
`regStdNo`,
`lecName`
FROM `Register` AS a JOIN `Lecture` AS b ON a.reglecno = b.lecno
where `reggrade` = 'A';

#실습 3-26
SELECT * FROM `Student` AS a
join `register` as b
join `lecture` as c;

#실습 3-27
SELECT 
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.reglecno = c.lecno
order by `regtotalscore` desc;


#실습 3-28
SELECT
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.reglecno = c.lecno
where `regGrade` = 'F';

#실습 3-29
SELECT 
	`stdNo`,
	`stdName`,
SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.reglecno = c.lecno
where `regGrade` <> 'F'
group by `stdno`;


#실습 3-30
SELECT 
	`stdNo`,
	`stdName`,
GROUP_CONCAT(`lecName`) AS `신청과목`,
GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.reglecno = c.lecno
where `regGrade` <> 'F'
group by `stdno`;



