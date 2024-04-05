
-- 1) 평점이 3.0에서 4.0사이의 학생을 검색하라
SELECT *
from student
where avr BETWEEN 3.0 and 4.0;

-- 2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라

ALTER SESSION set NLS_DATE_FORMAT ='YYYY/MM/DD:HH24:MI:SS';

SELECT *
from PROFESSOR
where hiredate BETWEEN '1994/1/1:00:00:00' and '1994/12/31:23:59';

-- 3) 화학과와 물리학과, 생물학과 학생을 검색하라
SELECT *
from student
where major IN('화학', '물리', '생물');

-- 4) 정교수와 조교수를 검색하라
SELECT *
from PROFESSOR
where orders IN('정교수', '조교수');


-- 5) 학점수가 1학점, 2학점인 과목을 검색하라
SELECT * 
from course
where st_num IN('1', '2');


-- 6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT *
from STUDENT
where syear IN('1', '2') and avr BETWEEN 2.0 and 3.0
order by syear;

-- 7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라
SELECT *
from student
where major IN('화학', '물리') and syear IN('1', '2')
order by avr DESC;
