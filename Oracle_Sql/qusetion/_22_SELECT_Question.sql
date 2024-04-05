[JOIN ON 절로 해결]

1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT cname, pname
from professor
join course on professor.pno=course.pno;


2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT sname, result
from student
join score on student.sno=score.sno;



3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라


4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라


5) 모든 교수의 명단과 담당 과목을 검색한다



6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)

