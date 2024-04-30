--1) 주제 : 트랜잭션
--        ; 트랜잭션은 반드시 함께 실행되는 작업의 단위를 의미한다.
--        즉 사용자의 의도에 따라 여러 개의 문장으로 구성된 트랙잭션은
--        반드시 동시에 실행(COMMIT)되거나 취소(ROLLBACK)된다.
--        RDBMS는 트랜잭션을 통해 작업의 단위를 결정함으로써 작업
--        결과의 신뢰성을 확보한다.
--        
--        예를 들어, 금융거래중에 계좌 이체를 생각해보자.
--        A라는 사람이 소유 계좌의 금액 중 100만원을 B라는 사람의
--        계좌로 이체한다면 최소 2가지 작업이 수행되어야 한다.
--        첫 번째 작업은 A의 계좌에서 100만원이 출금되는 것이고,
--        두 번째 작업은 B의 계좌에 100만원이 입금되는 것이다.
--        그런데 만약 A의 계좌에서 100만원이 출금된 이후
--        두 번째 작업이 수행되기 전에 시스템이 다운된다면 
--        B의 계좌에 돈이 입금되지 않고 A의 계좌에서만 100만원만
--        없어지게 될 수 있다.
--        
--        이런 문제를 방지하기 위해 2개의 작업을 하나의 트랜잭션으로
--        묶어 놓으면 2개의 작업이 모두 실행되지 않으면 모두 취소됨
--        으로 거래의 신뢰도를 높일 수 있다.
--        즉, 두 번째 작업인 입금이 실행되지 않으면 첫 번째 출금
--        작업은 자동으로 취소되도록 함으로써 거래의 신뢰성을
--        확보하는 것이다.
--
--2) 트랜잭션의 시작과 종료
-- 1) 시작
--  이전 트랜잭션이 종료된 이후 DML(INSERT, UPDATE, DELETE)문
--  이나 DDL(CREATE, ALTER, DROP, TRUNCATE), 
--  DCL(GRANT, REVOKE)문장이 실행되었을 때 시작된다.
--  
-- 2) 종료
--  COMMIT 이나 ROLLBACK 명령이 실행될 때 종료된다
--  DDL 이나 DCL 문장의 실행이 완료되면 자동으로 종료된다
--  사용자의 정상 종료 시에 종료된다
--  데드락(Deadlock)이 걸리면 트랜잭션의 일부만 종료된다
--  트랜잭션은 하나의 세션에서 단 하나만 시작할 수 있다
--  
-- 3) 트랜잭션와 언두 세그먼트(Undo segment)
--  DML 작업을 ROLLBACK 하기 위해서는 작업 이전 데이터를
--  어딘가에 저장해두어야 한다.
--  오라클은 DML 이 발생하면 즉시 테이블의 내용을 변경함으로써
--  DELETE 나 UPDATE, INSERT 문을 실행하면 테이블의 정보가
--  즉시 변경된다.
--  그런데 사용자가 ROLLBACK 을 실행하면 DML 작업에 의해서
--  변경된 정보를 이전 정보로 환원해야 하는데 만일 이전 정보를
--  저장하고 있지 않다면 ROLLBACK 을 실행할 수 없게 된다.
--  이렇게 작업 이전 정보를 저장하고 관리하는 것은 트랜잭션의
--  기본적인 기능이며 이를 위해서 오라클은 Undo tablespace 와
--  Undo segment 라는 물리적인 구조를 이용한다.
--  이들은 모두 자동으로 관리되며 사용자는 이들 정보를 직접
--  볼 수 없으며 단지 트랜잭션에만 사용된다.
--  
-- 4) 트랜잭션 과정
--  오라클은 INSERT 문이 실행될 때 행이 입력되고
--  입력된 행에만 잠금이 걸린다.
--  COMMIT 될 때 잠금이 풀린다.
--  UPDATE 나 DELETE 도 동일하다.
--  
--  UPDATE 문을 통해 트랜잭션 과정을 살펴보겠다.
--  a) UPDATE 문장이 테이블에 발생하면, 문장 수행을 위해
--    사용할 언두 세그먼트(Undo segment)를 결정한다.
--  b) 테이블에 저장되어 있던 원래 값(5)이 Undo segment 에
--    저장된다
--  c) UPDATE 된 값(7)이 테이블에 저장된다
--  d) 값이 변경된 행은 독점 잠금이 발생된다
--  e) 테이블에는 공유 잠금이 발생된다.
--  f) 트랜잭션이 COMMIT 되면 잠금은 해제되고, 변경된 값(7)은
--    영구히 저장된다.
--  g) 트랜잭션이 ROLLBACK 되면 Undo segment 에 저장했던
--    원래 값(5)을 테이블로 환원하고 잠금이 해제된다.
-- 
-- 참고 : 오라클은 DML 명령어가 수행될 때 데이터가 테이블에 적용되지만
--       MS-SQL 은 COMMIT 이 수행될 때 데이터가 테이블에 적용된다.
--       오라클은 행마다 독점 잠금을 걸게 된다
--       MS-SQL 은 I/O 단위인 페이지 전체에 독점 잠금을 건다
--       
--  *독점 잠금(Exclusive Lock)
--   ; 현재 세션이외에는 접근을 불허하는 잠금이다.
--    트랜잭션으로 행에 잠금이 발행하면 다른 세션에서는 해당
--    행을 검색할 수 없고 단지 Undo segment 의 정보만 보게 된다.
--    그리고 이 때 테이블에서는 공유 잠금이 발생하게 된다.
--  *공유 잠금(Share Lock)
--   ; 이것은 DML 작업으로 행이 잠겨있는 테이블에 대해서
--    DDL(DROP, ALTER)작업을 방지한다.
 
 트랜잭션과 잠금의 이해
 * 실습에는 2개의 일반 사용자 세션이 사용된다
 동일한 bitcamp계정으로 접속한 SQL Developer를
 2개 실행한다.
 * 2개의 창은 각각 [세션 1]: _40_TRANSACTION.sql
                [세션 2] : _41_TRANSACTION_TEST.sql
 
 [세션 1]
 
 1) 먼저 최초의 마초의 평점을 확인한다 1.68
 SELECT sno, sname, avr
 FROM student
 WHERE sname = '마초';
 
 2) 마초의 평점을 0.1로 갱신한다
 UPDATE student
 SET avr = 0.1
 WHERE sname = '마초';
 
 3) 테이블에는 데이터가 적용되었고
   갱신된 0.1 정보가 보여진다
   하지만 아직 COMMIT 완료되지 않았으므로
   다른 세션에서는 이전 정보를 보여주게 된다.
 SELECT sno, sname, avr
 FROM student
 WHERE sname = '마초';
 
 5) COMMIT 을 하여 트랜잭션을 완료한다
   트랜잭션이 완료되면 잠금이 해제되게 된다.
 COMMIT;

  UPDATE student
 set major = '화학'
 where sname = '마초';

 UPDATE student
 set major = '사회'
 where sname = '마초';
 
 commit;

 *트랜잭션에 의한 대기 현상 확인
 
 1) 마초의 학과를 사회학과로 변경한다
 --화학
SELECT major, sno, sname
from student
where sname='마초';


-- 화학 -? 사회
 UPDATE student
 SET major = '사회'
 WHERE sname = '마초';
 
 2) 마초의 학과를 확인한다
   아직 COMMIT 은 하지 않았다
   갱신된 정보가 잘 보여진다
 SELECT sno, sname, major
 FROM student
 WHERE sname = '마초';

5) 아직 세션1이 COMMIT 이 완료되기 전에
  세션2가 마초의 학과의 갱신을 시도했다
  이 때 이미 세션1에 의해 독점 잠금이 되어있으므로
  상대인 세션2는 대기 상태에 들어가게 된다
  그래서 세션1은 COMMIT 을 완료하자
  그러면 다른 세션은 대기가 풀리고 명령이 실행된다

  COMMIT;
  
6)세션1이 변경한 정보인 '사회'가 잘 보인다
 SELECT sno, sname, major
 FROM student
 WHERE sname = '마초';
  
  
  * 데드락(Dead Lock)을 발생하고 RDBMS의 
  처리 과정을 확인한다
1) 관우와 장각의 학과를 확인한다

--화학 화학
SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');


2) 관우의 학과를 경제학과로 갱신한다
  관우의 레코드 행은 독점 잠금이 발생되었다
UPDATE student
SET major = '경제'
WHERE sname = '관우';

5) 세션2에 의해 장각의 레코드 행이 독점 잠금이
  걸린 줄을 모르고 장각의 학과를 사회로 갱신을
  시도한다
  UPDATE student
  SET major = '사회'
  WHERE sname = '장각';

        
        