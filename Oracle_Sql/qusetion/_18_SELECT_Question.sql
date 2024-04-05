

1) 학생중에 동명이인을 검색한다

2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
select pname, section, c.pno
from course c, professor p
where c.pno=p.pno
order by p.pno;

3) 이번 학기 등록된 모든 과목과 담당 교수의 학점 순으로 검색한다
select cname, st_num, pname
from course c, professor p
where c.pno=p.pno
order by st_num DESC;