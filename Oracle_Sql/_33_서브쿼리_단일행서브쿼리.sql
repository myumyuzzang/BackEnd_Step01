서브 쿼리 - 단일 행 서브쿼리
; 서브 쿼리는 두 개의 쿼리를 결합하여 하나의 문장으로
표현하는 것이다
1) 단일 행 서브쿼리
 ; 서브쿼리가 하나의 컬럼에서 하나의 행을 검색한다
2) 다중 행 서브쿼리
 ; 서브쿼리가 하나의 컬럼에서 여러 개의 행을 검색한다
3) 다중 열 서브쿼리
 ; 서브쿼리가 여러 개의 컬럼을 검색한다

4) 서브 쿼리는 WHERE 절, HAVING 절과 같이 조건절에 주로
 쓰인다. FROM 절에 쓰이는 경우도 있다.
 FROM 절에 서브쿼리를 쓰는 경우를 인라인뷰(Inline View)
 라고 한다

SELECT 컬럼, ...
FROM 테이블
WHERE 컬럼 <단일 행 연산자> (SELECT 문: Sub Query);
1) 단일 행 연산자가 사용됨으로 반드시 서브쿼리의 결과
 값은 1개만 검색돼야 한다
2) 서브 쿼리는 반드시 괄호로 묶는다
3) 서브 쿼리는 메인 쿼리 실행 전에 실행된다
4) 서브 쿼리의 검색된 결과값은 메인 쿼리에 사용된다
5) 단일 행 연산자 오른쪽에 기술한다
   (=, <, >, <=, >=, !=)
6) WHERE 절에 기술된 열의 숫자와 타입은
  SELECT 절과 1:1 대응관계가 되어야 한다.

1)김연아보다 급여를 많이 받는 사원을 검색한다
--1) 김연아의 급여를 검색한다
--2) 김연아의 급여와 비교하여 더 많이 받는 사원을 검색한다

select sal
from emp
where ename='김연아';

select sal, eno, ename
from emp
where sal > 3300
order by sal DESC;

select sal, eno, ename
from emp
where sal > (select sal from emp where ename='김연아')
order by sal DESC;
             
2)노육과 평점이 동일한 학생의 정보를 검색하라
--노육이 3명이라서 단일 행 연산자를 사용할 수가 없다
--그래서 Error 가 발생했다
select sno, sname, avr
from student
where sname='노육';

select sno, sname, avr
from student
where avr = (select avr
              from student
              where sname='노육';);

--다중 행 서브 쿼리 (결과값이 여러 개의 행이다)
select sno, sname, avr
from student
where avr in (select avr
              from student
              where sname='노육';);
             
예측하기 힘든 단일 행 서브쿼리를 수정하는 방법
1) '=' 연산자는 'IN'연산자로 바꾼다 - 다중행 서브쿼리로 전환
2) 부등호(<, >, <=, >=)는 any, all - 다중행 서브쿼리로 전환 
  연산자를 추가한다
3) Max, Min 그룹 함수를 사용한다 - 여러 개중에 1개만 선택



3) 김연아와 부서가 다르고 동일한 업무를 하는 사원의 정보를 검색하라
 a) 김연아의 부서를 검색한다 - Sub Query
 b) 김연아의 업무를 검색한다 - Sub Query
 c) 위 조건의 사원의 정보를 검색한다 - Main Query

 select dno
 from emp
 where ename='김연아';

select job
from emp 
where ename = '김연아';

select *
from emp
where dno!='02' and job='회계';

select *
from emp
where dno!=( select dno
              from emp
              where ename='김연아') 
 and job=(select job
            from emp 
            where ename = '김연아');

         
4) 부서 중 가장 급여를 많이 받는 부서를 검색하라
--1) 부서중 평균 최대급여 계산
--2) 일치하는 부서를 출력

--부서별 평균급여
select dno, AVG(sal)
from emp
GROUP by dno;

--부서별 평균을 구하고 가장 큰 값을 구한다.
select max(AVG(sal))
from emp
GROUP by dno;

--부서의 평균급여중 최대값 
select dno, AVG(sal)
from emp
GROUP by dno
Having AVG(sal)=9499.5;

select dno, AVG(sal)
from emp
GROUP by dno
Having AVG(sal)=(select max(AVG(sal))
                  from emp
                  GROUP by dno);


5) 부산에서 근무하는 사원의 정보를 검색한다
  a) 부산에 근무하는 부서번호
  b) 해당 부서번호와 일치하는 사원의 정보 검색

select dno, dname
from dept
where loc='부산';

select dno
from dept
where loc='부산';

select *
from emp
where dno='20';
         

select *
from emp
where dno=(select dno
            from dept
            where loc='부산');






