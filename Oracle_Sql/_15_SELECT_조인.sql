--[JOIN]
--; 관계형 데이터베이스 시스템
-- (Oracle, MySQL(Maria), SQL-Server(MS-SQL)...)
-- 테이블-테이블 연관 관계를 맺고 있다
-- ex) emp-dno : 사원이 어느 부서에 소속되어 있는지
--     dept-dno : 사원번호
--     김연아 02 - 02 회계부서

-- 테이블을 나눠야 하는 이유

-- entity 회사
-- 1101 김연아 여 테스트 32    99 무선사업부 수원 
-- 1102 홍길동 남 개발 32      99 무선사업부 수원
-- 1103 임꺽정 남 영업 32      99 무선사업부 수원 
-- 1104 장길산 님 테스트 32    99 무선사업부 수원
-- --------------------------------------------------
-- entity 부서
-- 99 무선사업부 수원

-- entity 사원
-- 1101 김연아 여 테스트 32 99
-- 1102 홍길동 남 개발 34   99
-- 1103 임꺽정 남 영업 42   99  
-- 1104 장길산 님 테스트 22 99 

-- 중복데이터 
     
--1) 각 사원의 근무 부서를 검색한다
select dno, eno, ename
from emp;

SELECT dno, dname
from dept;


--등가 조인
--; 두 테이블의 공통 컬럼을 = 연산자로 조건을 부여한 것
-- dno는 emp와 dept에 모두 존재하므로 명시적으로 table명.cloumn명 이렇게 해야 한다.
SELECT eno, ename, emp.dno, dept.dno, dname
from emp, dept
where emp.dno=dept.dno;

--2) 광주에서 근무하는 직원의 명단을 검색하세요
--  (부서번호와 부서명도 검색하세요)
SELECT *
from emp;

SELECT *
from DEPT;

SELECT loc, dept.dno, dname, eno, ename
from emp, dept
where emp.dno=dept.dno
and loc='광주';

--비등가 조인(특정값의 범위를 얻을 때)
--; 한 테이블의 특정값을 가지고,
-- 다른 테이블에서 범위 결과를 추출할 때
--3) 각 직원의 급여를 10%인상한 경우 급여 등급을 검색한다

-- 10% 인상 급여 계산
SELECT sal "기존 급여", sal*1.1 "10% 인상 급여", eno, ename
from emp;

-- 현재 급여 등급 계산
SELECT grade, sal, eno, ename
from emp, salgrade
where sal BETWEEN losal and hisal;


SELECT grade, sal, eno, ename
from emp, salgrade
where sal BETWEEN losal and hisal
order by grade, sal desc;


SELECT grade, sal*1.1 "10% 인상 급여", eno, ename
from emp, salgrade
where sal*1.1 BETWEEN losal and hisal
order by 1, 2 desc;


--4) 잘못된 조인 (Cross Join)
--; 조인 조건이 없으면 Cross Join 이라고 하며
-- 테이블들의 모든 행이 1:1 교차하게 된다.
-- 결과에 의미가 없다

-- 모든 사원이 모든 부서에 매칭되는 결과를 보고 싶을 때
-- 그 외는 의미 없다
SELECT *
from emp, dept;
  
  
  
  
  
  
  
  
  
  
  
  



