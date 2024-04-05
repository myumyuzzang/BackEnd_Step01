
--1) 유공과와 생물과, 식영과 학생을 검색하라
SELECT *
from student
where major='유공' or  major='생물' or major='식영';


--2) 화학과가 아닌 학생중에 1학년 학생을 검색하라
SELECT *
from student
where SYEAR='1'
and not major='화학';


--3) 물리학과 3학년 학생을 검색하라
SELECT * from STUDENT
where major='물리' and syear='3';


--4) 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT * from student
where avr >=2.0 and avr <=3.0;

--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
SELECT * from COURSE
where pno is null and st_num='3';

--6) 화학과 관련된 과목중 평점이 2학점 이하인 과목을 검색하라
SELECT * from COURSE
where cname like '%화학' 
and st_num<=2;

--7) 화학과 정교수를 검색하라
SELECT * from PROFESSOR
where section='화학'
and orders='정교수';

--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
SELECT * from STUDENT
where major='물리' and sname like '사마%';

--9) 부임일이 1995년 이전인 정교수를 검색하라
ALTER SESSION set NLS_DATE_FORMAT ='YYYY/MM/DD';

SELECT * from PROFESSOR
WHERE hiredate <= '1995/01/01'
and ORDERS='정교수';

--10) 성과 이름이 각각 1글자인 교수를 검색하라
SELECT * from PROFESSOR
where pname like '__';

