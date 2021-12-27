--4주차 
-- 함수 : 입력값을 넣으면 출력값이 나옴
-- 오라클이 가지고 있는 유용한 함수 >> 내장함수
-- 내장함수는 "단일행함수" 와 "다중행함수"로 나뉨. 이번주차는 단일행 함수에 대해서 알아봄
-- 단일행함수란 ? > 매개변수가 하나인 함수 / 결과로 출력되는 값이 여러개입니다.
select lower(ename) from emp ;

-- 다중행 함수란? > 여러개(컬럼전체거나 컬럼의 일부)가 필요하며 결과로 출력되는 값이 한개입니다.
select sum(sal) from emp;

--- upper,lower,initcap
--upper: 소문자가 있는 값을 모두 대문자로 바꿔주는 함수
select upper(ename) from emp;
--lower: 대문자가 있는 값을 모두 소문자로 바꿔주는 함수
select lower (ename) from emp;
--initcap: 첫글자만 대문자로 바꿔주는 함수
select initcap (ename) from emp;

--upper, lower 이친구들은 like와 와일드카드와 함께 검색에 많이 사용되는 함수
select *
  from emp
  where ename like '%scott%';
  
 select *
  from emp
  where ename like '%SCOTT%'; 
  
 select *
  from emp
  where lower(ename) like '%scott%'; 
  
select ename 
  from emp
  where ename = 'SCOTT' ;

select lower(ename) 
  from emp
  where ename = 'SCOTT' ;  --소문자로 출력됨
  
-- 입력받은 언어 가 대문자이거나 소문자이면 ..?? >>> 파이썬의 범위가 아님
 
/* --실제 게시글 검색 예제, 이 sql은 토드에 입력된다기 보다는 구현하고자 하는 언어에서 디비랑 연결하는 컨트롤러에 입력하는 sql
  select title, content
  from board
  where upper(title) like '%사용자가 입력한 값%' --> 이값은 자바나 파이썬같은 메인언어에서 대문자로 변환된 값
  or upper(content) like  '%사용자가 입력한 값%';  
 */
 
 
 --Dual 계정,Dual 테이블
 --> 임시 계정입니다.
 -- 오라클에서만 지원 -- 오라클의 고유기능
 -- MY ASQL은 그냥 안써도 됨
 -- EMP로 할수 없는 예시들
 select '11111' as name   
 from dual ;
 
 select '11111' as name, '122553' as num 
 from dual;

-- LENGTH함수
-- 문자열의 길이를 반환하는 함수입니다.
--> 독자적으로 쓰이기 보다는 다른 함수랑 같이 쓰임
select ename, length(ename)
 from emp;
 
select ename, length(ename)
from emp
where length(ename) >= 6 ;

-- substr() 함수
-- 모든 문자열을 사용할 수 있는 언어라면 다 갖고 있는 함수
--특정 문자열 추출 함수
 -- 'HELLO' substar('HELLO', 1, 2) = 'HE' >> 첫글자 H 에서 H를 포함한 두글자
 -- (문자열,숫자) 의 경우 해당 숫자 자리에서 끝까지 추출
 
 select substr('HELLO', 1, 2) 
    from dual;
  
 select job, substr(job,1,2), substr(job,3,2), substr(job,5)
    from emp ;
    
 --얘는 개인정보를 다룰 때 유용한 친구입니다.
 
 select substr('970130-1234567',1,6)
 from dual;
 
 --instr은 안쓰니까 안다룸 --자바나 파이썬에서 더 유용하게 쓰이기 때문
 
 ---replace("문자열데이터", "대체될 문자열", 대체할 문자") : 데이터안에 특정 문자를 다른 문자로 대체하는 함수입니다.
 select replace('10/5','/','-')
  from dual;    
 -- 시리얼번호나 통장번호입력시 많이 사용됨
  select replace('10-05','-','')
  from dual;    
  
 -- rpad, lpad : 오른쪽, 왼쪽에 특정문자열을 지우는 함수
 -- rpad(substr('001008-4155550',1,7),'*',14) => 001008-*******
 -- 개인정보 유출이 염려되는 항목에 처리됨
 --substr('001008-1111111',1,7) --> '001008-'
 -- rpad,lpad는 rpad('hello', 10, '*') --> *****hello
 -- lpad('hello', 10, '*') --> hello*****
 select rpad(substr('001008-4155550',1,7), 14,'*') --substr(), rpad()는 많이 사용하는 함수의 대표
 from dual;
  
 select rpad(substr('001008-4155550',1,7), length('001008-4155550'),'*') 
 from dual; 
 
 select lpad(substr('001008-4155550',7), length('001008-4155550'),'*') 
 from dual; 
 
 -- concat은 두문자열 데이터를 합쳐주는 함수입니다.
 -- concat(A,B) -> concat('aaa','bbb')>> 'aaabbb'
 select concat(substr('001008-1122334',1,7),'*******')
 from dual;
 
 --|| : 평소에 프로그래밍에서 많이 썼던 or 연산자입니다.
 -- 여기서는 문자열을 합치는데에도 사용할 수 있습니다. 
 select substr('001008-4156810',1,7)||'*******'
 from dual;  
 
 --trim : 안에 문자열을 넣으면 공백을 지워줍니다. 
 --trim(문자열 데이터, 특정문자) >> 특정문자만 지워줌
 
 --round 함수 : 반올림함수
 --round(1) : 소수점 둘째자리 숫자에서 반올림합니다.
 select round(28.85,1)
 from dual;
 select round(28.85,0)
 from dual; 
  select round(28.85,-1)
 from dual;  --실수부에서 반올림 할 수 도있음
 
 --trunc : 버림 연산 함수
 --round랑 똑같은데 반올림이아니라 버림연산
 
 -- mod함수
 -- mod는 나머지를 구하는 함수
 --> 10 % 3 =1 == mod(10,3)
 