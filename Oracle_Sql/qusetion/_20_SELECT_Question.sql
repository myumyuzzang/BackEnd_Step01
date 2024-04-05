--NATURAL JOIN / USING 절로 해결

1) 송강 교수가 강의하는 과목을 검색한다
select pname, cname 
from professor Natural join course
where pname='송강';

2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
select cname, pname
from course Natural join professor
where cname like '%화학%';

3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
select cname, st_num, pname
from course Natural join professor
where st_num='2';

4) 화학과 교수가 강의하는 과목을 검색한다
select section, pname, cname
from course Natural join professor
where section='화학';


5) 화학과 1학년 학생의 기말고사 성적을 검색한다
select major, syear, sname, result
from student Natural join score
where major='화학' and syear='1';


6) 일반화학 과목의 기말고사 점수를 검색한다
select cname, result
from score Natural join course
where cname='일반화학';

7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
select major, syear, sname, cname, result
from student 
join score using(sno)
join course using(cno)
where major='화학' and syear='1' and cname='일반화학';

8) 화학과 1학년 학생이 수강하는 과목을 검색한다
select major, syear, sname, cname
from student 
join score using(sno)
join course using(cno)
where major='화학' and syear='1'
order by sname;