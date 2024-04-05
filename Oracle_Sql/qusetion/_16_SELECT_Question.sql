
-- 1) 송강 교수가 강의하는 과목을 검색한다
SELECT cno, pname, section, cname
from PROFESSOR, course
where professor.pno=course.pno
and pname='송강';

-- 2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT cno, pname, professor.pno, course.pno, cname
from PROFESSOR, COURSE
where professor.pno=course.pno
and cname like '%화학%';

-- 3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT cname, st_num, pname, professor.pno, course.pno, cno
from PROFESSOR, COURSE
where professor.pno=course.pno
and st_num='2';


-- 4) 화학과 교수가 강의하는 과목을 검색한다
SELECT pname, section, cname
from PROFESSOR, COURSE
where professor.pno=course.pno
and section='화학';

-- 5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major, sname, syear, result
from score, student
where score.sno=student.sno
and major='화학' and syear='1';

-- 6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT score.cno, cname, result
from course, score
where score.cno=course.cno
and score.cno='1211';

-- 7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT sname, syear, result, SCORE.cno
FROM STUDENT, SCORE, COURSE
WHERE SCORE.cno=COURSE.cno and STUDENT.sno=SCORE.sno
and major='화학' and syear='1' and SCORE.cno='1211';


-- 8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT sname, syear, course.cno, cname
FROM STUDENT, SCORE, COURSE
WHERE SCORE.cno=COURSE.cno and STUDENT.sno=SCORE.sno
and major='화학' and syear='1';


-- 9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다



