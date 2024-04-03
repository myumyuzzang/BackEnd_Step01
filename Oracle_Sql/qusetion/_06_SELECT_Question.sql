
--1) '__학과인 __학생의 현재 평점은 __입니다' 형태로 학생의 정보를 출력하라
SELECT major 학과인, sname "학생의 현재 평점은", avr 입니다
from student;

--2) '__과목은 __학점 과목입니다.' 형태로 과목의 정보를 출력하라
SELECT major 과목은, avr 학점, major 과목입니다
from student;

--3) '__교수는 __학과 소속입니다.' 형태로 교수의 정보를 출력하라
SELECT pname 교수는, section "학과 소속입니다"
from PROFESSOR;

--4) 학교에는 어떤 학과가 있는지 검색한다(학생 테이블 기반으로 검색한다)
SELECT DISTINCT major
FROM student;

--5) 학교에는 어떤 학과가 있는지 검색한다(교수 테이블 기반으로 검색한다)
SELECT * FROM PROFESSOR;

SELECT DISTINCT section
FROM PROFESSOR;

--6) 교수의 지위는 어떤 것들이 있는지 검색한다
SELECT DISTINCT orders
FROM PROFESSOR; 

