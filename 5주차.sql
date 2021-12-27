--5주차

-- 1) 날짜 데이터★★★
--   모든 DB에서 다루는 매우 중요한 날짜 관련 데이터 입니다.
--    오늘 다룰 날짜 내용은 정말 중요합ㄴ디ㅏ.

--SYSDATE 함수: 오늘 날짜를 출력하는 함수다. 다만 매개변수가 필요 없기 때문에 괄호가 필요 없다.
SELECT SYSDATE AS NOW,
       SYSDATE+1 AS TOMORROW, 
       SYSDATE-1 AS YETERDAY
    FROM DUAL;
 
-- ADD_MONTHS 함수 : 특정 날짜에서 달 단위로 더한 날짜를 출력하는 함수
-- 특징 : 한달의 날짜수를 반영하여 30일,31일, 윤달이 있는 달도 정확히 계산해줌.
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
   FROM DUAL;

-- MONTHS_BETWEEN 함수 : 두 날짜간에 얼마나 많은 달이 차이가 나는지 알려주는 함수입니다.
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS months3
  FROM EMP;     
 -- 컴퓨터에서 날짜 저장을 하는 방식이 정수입니다. 이전 날짜는 더 작은 정수이므로 MPNTHS1 값은 음수가 됨 
 -- 보통 시간과 날짜는 소수로 나오기 때문에 TRUNC와 함꼐 많이 사용됨
 
 
--NEXT_DAY 함수 : 지정한 날짜로부터 돌아오는 주의 설정한 요일의 날짜를 출력함.
SELECT NEXT_DAY(SYSDATE+3, '월요일')
 FROM DUAL;
 
 --LAST_DAY 함수 : 지정한 날짜가 속한 달의 마지막 날을 출력하는 함수입니다.
 SELECT LAST_DAY(SYSDATE)
  FROM DUAL;
  
 --- 데이터 타입의 큰 3분류 : NUMBER, CHAR, DATE
 -- 형변환 함수 : int("123456")<파이썬 , parse_int("123456")<java
 select to_number('123456')
  from DUAL;
 
SELECT TO_char(123456)
 from dual;
 
-- yyyy,mm,dd 등은 날짜 포맷이라고 한다. 
-- 다른 언어와 다르게 분은 mi로 표현한다 (hh-mi-ss)
--(원래 sysdate시 시간까지 나오는데 이걸 없애려고 형변환을 사용하기도 한다.)
select to_char(sysdate, 'yyyy-mm-dd')
 from dual;
select to_char(sysdate, 'hh:mi:ss')
 from dual;
 
select to_char(hiredate,'yyyy-mm-dd')
 from dual;
 
select to_char(hiredate, 'yyyy-mm-dd')
 from emp;
 
 select to_date('2020-2-2')
  from dual; 
  
 -- 2) NULL 처리 함수
 -- NULL 처리 연산자 IS NULL
 -- NULL 처리 함수 : where문 뿐만 아니라 select 절에서도 잘 쓰입니다.
 
 -- NVL : NULL 값 처리 함수입니다.
 -- NVL(컬럼명, 컬럼에 있는 값이 null이면 처리할 숫자) : 널 값을 처리하는데 효율적으로 사용됨.
/*
   if (a == null)
   {
        a = 0;
    }
*/
 SELECT EMPNO,ENAME,SAL, COMM, SAL+COMM, NVL(COMM, 0), SAL+NVL(COMM,0)
  FROM EMP;
-- NVL2  
-- NVL2 : NVL2(지정할 컬럼을 설정, (널값이 아니면 출력될 숫자나 문자열), (널값이 맞으면 출력될 숫자나 문자열))
-- 널일때와 널이 아닐때의 값을 지정해서 처리할 수 있다.
-- NVL 함수에 비해 더 많이 쓰인다.
/*
   if (a == null)
   {
        a = 0;
    }
    else
    {
        a = 5;
    }
*/
 SELECT EMPNO,ENAME,SAL, COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM,SAL*12+COMM, SAL*12) AS ANSAL
  FROM EMP;
 
-- DECODE() 함수 :
select EMPNO,
       ENAME,
       JOB, 
       SAL,
       DECODE (JOB, 
               'MANAGER', SAL*1.1,
               'SALESMAN', SAL*1.05,
               'ANALYST', SAL,
                SAL*1.03) AS UPSAL
   FROM EMP;
    
/* 
SWITCH CASE 문과 DECODE 함수가 비슷하다라는 것을 알 수 있습니다.
범위가 아니라 일치해야만 조건에 따라 움직임 SAL>500 이 조건이 될 수 없음 
IF (JOB == 'MANAGER')
 {
    SAL = SAL*1.1;
 }  
 else IF (JOB == 'SALESMAN')
 {
    SAL = SAL*1.05;
 }  
 else IF (JOB == 'ANALYST')
 { }
 else 
  {
    SAL = SAL*1.03;
 } 
*/

--CASE 함수
-- IF 문과 많이 닮은 함수 DECODE와 달리 일치하지 않아도 괜찮음.
-- (1) 위의 decode문을 case문으로
select empno, ename, job, sal,
  case job
       when 'manager' then sal*1.1
       when 'SALESMAN' then sal*1.05
       when 'ANALYST' then sal
       ELSE SAL*1.03
     END AS UPSAL
     FROM EMP;      
     
 SELECT EMPNO, ENAME, COMM,
        CASE
         WHEN COMM IS NULL THEN '해당사항 없음'
         WHEN COMM = 0 THEN '수당 없음'
         WHEN COMM > 0 THEN '수당 : ' || COMM
       END AS COMM_TEXT
   FROM EMP;
-- 위의 예시처럼 방향성을 지닌 코드로 작성하기 위해서는 CASE 뒤에 컬럼명을 작성하면 안됩니다.  
-- 함수는 괄호를 써서 많이 표현한다고 했음
-- 보통 컴퓨터 공학에서는 반환하지 않는 함수도 void로 선언하여 () 매개변수를 지정 할 수 있었음
-- 그러나 c++이나 다른 언어의 함수는 호출시 괄호()를 꼭 붙여야 합니다.
--하지만 오라클에서는 굳이 안에 값이 들어갈 필요가 없는 함수는 괄호를 붙여서 표현하지 않습니다.


-- 과제 175쪽 !  ! ! ! 