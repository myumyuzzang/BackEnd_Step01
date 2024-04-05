-- [관계 연산자 : AND, OR]

--1) 20번 부서원 중에 급여가 2000이상인 사원을 검색하세요
SELECT * 
from emp;

SELECT *
from emp
where dno='20';

SELECT *
from emp
where sal >= 2000;

SELECT *
from emp
where dno='20' and sal >= 2000;

SELECT dno, sal, eno, ename
from emp
where dno='20' and sal >= 2000;

--2) 30번 부서원 중에 급여가 2000이상이고 개발 업무를 담당하는
--  사원을 검색하세요

SELECT dno, eno, ename
from emp
where dno='30';

SELECT sal, eno, ename
from emp
where sal >= 2000
order by sal DESC;

SELECT job, eno, ename
from EMP
where job='개발';

SELECT dno, sal, job, eno, ename
from EMP
where dno='30' and sal >= 2000 and job='개발'
order by sal DESC;

--3) 관계 연산자 우선순위
-- NOT > AND > OR

--10번 부서이거나 월급이 1600초과하는 사원중에
--보너스가 600을 초과하는 사원
--=> 문맥의 구분을 정확히 하지 않으면 잘못된 결과를 만들기 쉽다.

--10번 부서이거나 월급이 1600초과하는 사원중에, 보너스가 600을 초과하는 사원

SELECT *
from EMP
where dno='10'
or sal > 1600
and comm > 600;

SELECT *
from EMP
where dno='10'
or (sal > 1600
and comm > 600);

SELECT *
from EMP
where (dno='10'
or sal > 1600)
and comm > 600;



-- [LIKE 연산자]
-- ; a. 문자열 검색시 사용
--   b. '_' : 반드시 한개의 문자를 대체
--      '%' : 문자열을 대체(문자가 없는 경우도 포함)
--   c.
--     LIKE '경%' => '경'으로 시작하는 모든 문자열
--                 경, 경제, 경영학과
--     LIKE '%과' => '과'로 끝나는 모든 문자열
--                 과, 다과, 화학과, 물리학과
--     LIKE '%김%' => '김'이란 글자가 들어간 문자열
--                 김, 김씨, 돌김, 되새김질
--     LIKE '화_' => '화'로 시작하는 두 글자 단어
--                 화학, 화약, 화장
--     LIKE '__화' => '화'로 끝나는 세글자 단어
--                 무궁화, 해당화, 운동화, 들국화
--     LIKE '_동_' => '동'이 가운데 들어간 세글자 단어
--                 원동기, 전동차

--4) 김씨 성을 가진 사원을 검색하세요
SELECT *
from emp
where ename like '김%';

--아래는 김퍼센트를 찾으므로 잘못되었다.
SELECT *
from emp
where ename ='김%';

-- 5) 이름이 '하늘'인 사원
SELECT *
from EMP
where ename like '%하늘';


-- 6) 성과 이름이 각각 한 글자인 사원을 검색하세요
SELECT *
from emp
where ename like '__';

-- 7) 성과 이름이 각각 한 글자인 학생을 검색하세요
SELECT *
from student
where sname like '__';

-- 8) 성과 이름이 각각 세 글자인 학생을 검색하세요  
SELECT *
from student
where sname like '___';

-- 9) 성이 '사마'씨로 시작하는 학생을 검색하세요
SELECT *
from student
where sname like '사마%';