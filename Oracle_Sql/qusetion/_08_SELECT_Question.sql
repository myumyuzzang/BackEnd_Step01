
-- 1) 성적순으로 학생의 이름을 검색하라
SELECT sname, avr
from student
order by avr DESC;

-- 2) 학과별 성적순으로 학생의 정보를 검색하라
SELECT sno, sname, major, avr
from student
order by major, avr;

-- 3) 학년별 성적순으로 학생의 정보를 검색하라
SELECT sno, sname, syear, avr
from student
order by syear, avr;

-- 4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
SELECT sname, syear, major, avr
from student
order by major, syear, avr DESC;

-- 5) 학점순으로 과목 이름을 검색하라
SELECT avr, major
from student
order by avr DESC, major;

-- 6) 각 학과별로 교수의 정보를 검색하라
SELECT pname, section
from professor;

-- 7) 지위별로 교수의 정보를 검색하라
SELECT pname, orders
from professor;

-- 8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
SELECT pname, section, hiredate
from PROFESSOR
order by section, hiredate DESC;

