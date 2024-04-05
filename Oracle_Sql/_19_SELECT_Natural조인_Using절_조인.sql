[Join 을 표현하는 여러가지 방법]
[Natural Join - 자연 조인]
; 컬럼이름과 자료형이 일치하는 것을 찾아서 Join 해준다

1) 자연 조인으로 각 사원의 근무 부서를 검색하세요

select dept.dno, dname, eno, ename
from emp, dept
where emp.dno=dept.dno;

select d.dno, dname, eno, ename
from emp e, dept d
where e.dno=d.dno;


--오라클 네가 알아서 동일한 (컬럼명+타입+크기) 찾아서 조인해라
select dno, dname, eno, ename
from emp
Natural join dept;

select dno, dname, eno, ename
from dept
Natural join emp;


--2) 광주에서 근무하는 직원의 명단을 검색하세요
--  (부서번호와 부서명도 검색하세요)
select loc, d.dno, dname, eno, ename
from emp e, dept d
where e.dno=d.dno
and loc='광주';

select loc, dno, dname, eno, ename
from emp
Natural join dept
where loc='광주';



[Using 절을 이용한 Join]
; NATURAL JOIN 은 공통 컬럼이 1개만 존재할 때 사용할 수 있다.
  둘 이상인 경우는 사용할 수 없다.
  이 때 = 등가 조인이나 Using 절을 이용한 Join 을 사용해야 한다
  
3) Using 절 조인으로 각 사원의 근무 부서를 검색하세요

select dno, dname, eno, ename
from emp
join dept using(dno);

--조인 컬럼을 명시적으로 USING 절에 써준다


--4) 광주에서 근무하는 직원의 명단을 검색하세요
--  (부서번호와 부서명도 검색하세요)
select loc, dno, dname, eno, ename
from emp
join dept using(dno)
where loc='광주';

5) 화학과 1학년 학생들의 유기화학 점수를 검색한다
화학과 1학년 학생 : student
유기화학 : course
점수 : score

student.sno = score.sno
score.cno = course.cno

select result 점수, major 학과, st.sno 학번, 
      sname 학생이름, co.cno 과목번호, 
      cname 과목명, syear 학년
from student st, course co, score sc
where st.sno=sc.sno and sc.cno=co.cno
and major='화학' 
and syear=1 
and cname='유기화학';


--NATURAL JOIN 은 공통 컬럼이 보이지 않기 때문에
--가독성이 떨어지는 경향이 있다.

select result 점수, major 학과, sno 학번, 
      sname 학생이름, cno 과목번호, 
      cname 과목명, syear 학년
from student Natural join score
     score Natural join course
where major='화학' 
and syear=1 
and cname='유기화학';


--using절
select result 점수, major 학과, sno 학번, 
      sname 학생이름, cno 과목번호, 
      cname 과목명, syear 학년
from student 
join score using(sno)
join course using(cno)
where major='화학' 
and syear=1 
and cname='유기화학';







  
  
  
  