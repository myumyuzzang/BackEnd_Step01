


--5) 모든 학생의 정보를 검색해라
SELECT * FROM student;

--7) 모든 과목의 정보를 검색해라
SELECT DISTINCT major 
FROM student;

--8) 기말고사 시험점수를 검색해라
SELECT result
FROM score;

--9) 학생들의 학과와 학년을 검색해라
SELECT syear, major
FROM student;

--10) 각 과목의 이름과 학점을 검색해라
SELECT major, avr
FROM student;

--11) 모든 교수의 직위를 검색해라
SELECT pname, orders
FROM PROFESSOR;