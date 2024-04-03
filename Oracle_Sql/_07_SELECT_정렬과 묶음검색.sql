
--[정렬]
--1) 사원을 이름을 급여순으로 검색하세요
  -- 내림차순 정렬 (ASC 오름차순)
-- 디폴트는 오름차순 ASC
SELECT eno, ename, sal
  FROM emp;

SELECT eno, ename, sal
  FROM emp
  ORDER BY sal;

  SELECT eno, ename, sal
  FROM emp
  ORDER BY sal ASC;

--2) 사원의 사번과 이름을 연봉 순으로 검색하세요
SELECT eno, ename, sal*12+NVL(comm,0) 연봉
FROM emp;

 SELECT eno, ename, sal*12+NVL(comm,0) 연봉
FROM emp
order by 연봉 desc;

 SELECT eno, ename, sal*12+NVL(comm,0) 연봉
FROM emp
order by sal*12+NVL(comm,0) desc;

 SELECT eno, ename, sal*12+NVL(comm,0) 연봉
FROM emp
order by 3 desc;

--[정렬을 이용한 묶음 검색]

--3) 업무별로 사원의 급여를 검색한다
select job, eno, ename, sal
from emp;

select job, eno, ename, sal
from emp
order by job;

--4) 각 부서별로 사원의 급여를 검색하세요
--   단 급여를 많이 받는 사람부터 검색하세요
DESC emp;

SELECT dno 부서번호, sal, eno, ename
from emp
order by dno;

SELECT dno 부서번호, sal, eno, ename
from emp
order by dno, sal DESC;







