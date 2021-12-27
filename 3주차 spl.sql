--3주차 수업 정리본
--지난 과제 체크

--지난 수업에서 빼먹은 부분 


--As 키워드 사용시 띄어쓰기가 없으면
-->      select ename as 직원이름
--> 혹은  select ename 직원이름 (따옴표는 있어도 되고 없어도 됨)

-- order by
--> 디폴트 값으로 asc라는 점
select * 
    from emp
    order by sal;
    
-- and 연산자 사용시 주의 사항
--> 데이터가 많으면 소요시간이 그만큼 커져서 시간이 굉장히 중요함

select *
  from emp
  where sal > 1000 
    and deptno = 30 ;

select *
  from emp
  where deptno = 30 
    and sal > 1000;      
 
 -- and절로 묶을 때 적게 출력이 되는 녀석들을 먼저 쓰는게 중요함
 
 --지난 강의 1 
 --select 절과 from  : 테이블을 조회할 때 사용하는 키워드
 -- where 절 : 프로그래밍 언어에서 if 문을 담당
 -- 산술연산자 : 사칙연산만 가능 
 -- 대소비교 연산자 : >, <, =, !=, <=, <=
 -- not 연산자 = !=  : 문자열로 된 연산자의 경우 nor 을 많이 사용한다
 -- in 연산자: =으로 묶어야 할 데이터 들이 or절로 묶여있을 때 사용
 -- 
select * from emp where not deptno in (30);
select * from emp where deptno != 30;
 
-------------------------------------------------------------------

-- 오늘 할 것 
-- between A and B : A와 B사이에 
-- not between A and B 
-- like : ~와 같은, ~처럼 (검색할 때 많이 사용되는 친구, 와일드카드)
-- not 연산자의 활용
-- is null (null값이 있는지 확인)
-- 집합 연산자: 사용 안합니다. 




--★  between A and B : A와 B사이에 
select * from emp
where sal >= 1000 and sal <=3000;
--서로 동치관계에 있음 
select * from emp
where sal between 1000 and 3000;




-- not between A and B 
select * from emp
where sal not between 2000 and 3000;





-- ★★★ 
-- like : ~와 같은, ~처럼 (검색할 때 많이 사용되는 친구, 와일드카드)
-- 게시글 조회하는 기능을 만들거나, 생년월일 검색 할 때 많이 사용함
-- 문자열 검색시 많이 사용하며 %는 몇개의 글자든 상관없이 아무 글자나 와도됨
-- %A% 이렇게 하면 A들어가는 얘들 다나옴 / A% 하면 에이로 시작하는
select *
  from emp 
  where ename like '%S%';
-- where birth like '00%';  (00년생 검색)
--와일드카드 (%) : 몇개의 글자든 상관없이 아무글자나
--와일드카드 (_) : 어떤 글자든, 한글자 
select ename
 from emp
 where ename like '__A';
-- 이렇게하면 세번째 글자가 A인 사람이 나옴


-- 게시판 정보 검색 예제
select title, contents
  from board
  where title like '%검색어%' or
        contents like '%검색어%'
-- 카페같은데서 검색시 내용 제목에 따라서 검색설정하는거 
--만약에 내용에서만 검색하면 title 은 --처리됨 




-- not 연산자의 활용





-- is null (null인지 아닌지 구분하는 연산자) (where절에 붙어서 연산자라고함)
-- 함수는 where 절에 굳이 넣지 않음
-- null : 아무값도 저장되어 있지 않은 값 (빈칸)

select * from emp where comm > 0;
-- 숫자랑 null은 연산을 수행할 수 없어서 null 값도 제외됨.

select * from emp
 where comm = null; --null값은 숫자가 아니므로 결과가 없음, comm은 숫자 값
--> 아무 결과가 나오지 않는다
-- 이를 대체하기 위해 나온 것이 is null 아래의 코드가 위의 결과를 불러옴
select * from emp
 where comm is null;
select * from emp
 where comm is not null;

-- 집합 연산자: 사용 안합니다. 
--> 세로로 붙여주는 연산자
select empno, ename, job from emp
union
select * from dept;
-- 잘안씀 불편하니까 (세로로 붙이면 보기가 불편)
-- 조인이라는 친구를 나중에 굉장히 많이 사용할 것임
-- intersect: 교집합 연산자
--    ㄴ 위에있는 테이블과 아래에 있는 테이블의 출력이 일치하는 row 만 출력
-- 주의 : 컬럼에 명시되는 데이터 타입이 같아야 합니다.
select empno, ename, job from emp
union
select * from dept;

select empno, ename, job from emp
intersect
select * from dept;


--숙제 125~126