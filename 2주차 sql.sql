-- 2주차 수업 정리본 
-- 싱글라인 주석
/*
얘는 멀티라인 주석입니다.
*/
--DESC
--테이블에 있는 컬럼이 어떤 속성을 가지는지를 알기 위해 사용하는 명령어
--f9로 실행, emp는 학습용 계정에 이미 존재

desc emp;


-- index pos 의 index가 배열의 index 와 똑같다고 보면 됨

desc emp;
--처음에 웹 백엔드 프로그래머로 회사에 들어가면 데이터베이스에 어떤 테이블이 있는지 모름
--my sql: show tables
--오라클 : 

SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';
--처음에 들어갔을 때 어떻게 회사 내 데이터베이스에 있는 테이블을 조회하는지 방법을 알았습니다.

SELECT * FROM EMP;
--SELECT는 EMP의 열을 고르는 것 
SELECT EMPNO, ENAME FROM EMP;

-- DISTINCT
-- > 데이터가 중복된 게 있으면 중복을 제거해주는 녀석
-- ALL : distinct 와 반대로 중복된거 전부 출력해주는 키워드인데, 예는 디폴트 값으로 설정되어있어서 안씁니다.

SELECT DISTINCT JOB FROM EMP;
select job from emp;

select * from emp;
select empno, ename, sal*12 from emp;

--사칙연산이 select 문에 적용됨

select empno, ename, sal*12+comm from emp; -- 빈값이 출력되는 이유는 null과 숫자를 계산하려고 했기 떄문
-- 확실한 연봉 정보를 위해서는 null 값인 친구들을 0으로 처리해주는 과정이 필요합니다.
-- 이과정은 뒤에 배워요

--별칭, 컬럼에 대한 별칭을 정할 수 있음
--as : ~로서, --> 이름을 지을 떄 사용
--as는 컬럼의 이름을 붙이고 한글, 사칙연산이 적용되어 있어도 충분히 적용할 수 있음
select empno as "직원번호", ename as "직원이름", sal*12 as "연봉" 
  from emp;

-- ORDER BY : 정렬해주는 친구, 행들을 정렬해주는 친구다.
-- 별칭으로도 충분히 정렬할 수 있으며 단 별칭으로 지정했다면 큰 따옴표로 감싸주어야 한다.
-- asc ; 오름차순 ascending desc ; 오름차순
-- 두 컬럼을 순차대로 지정될 수 있고 기준은 쓰는 순서 (월급>부서번호면 월급부터 우선 정렬)ex)아래 91쪽 예제
select empno as "직원번호", ename as "직원이름", sal*12 as "연봉" 
  from emp
order by "직원이름" desc;


--91쪽 예제
select *
  from emp
  order by deptno asc, sal desc;
 
--정렬 알고리즘을 여러분들은 배울겁니다. 알고리즘, 자료구조시간에 ??
--데이터베이스 정렬 알고리즘은 무조건 많이 씀
--실제로 웹 업무에서는 데이터베이스에서 정렬을 한 후에 나오게 많이 구분하고 있다.

--WHERE 절에 대해 알아보자 !
-- > IF문과 상당히 닮아있음 (SQL의 조건문 역할을 한다.)

-- SELECT [조회할 열 1],[조회할 열 2],[조회할 열 3]...
--  FROM [조회할 테이블]
-- WHERE [조건식] 조건식의 예시 : 조회할 열 > 500

SELECT *
  FROM emp
  where sal >= 3000;
  
 -- 셀렉션이란 ? 행단위로 데이터를 조회하는 방식으로 대표적으로 where절이 있습니다.
 -- 프로젝션이란 ? 열단위로 원하는 데이터를 조회하는 방식
 
 --컴퓨터 공학에서의 오칙연산 +,-,*,/,mod (%)
 -- 오라클에서는 4칙연산만 지원 (+,-,*,/)
 
 -- 비교연산자
 -- > 보통 다른 언어에서는 !=, ==, >=, <=, >, <
 -- 오라클에서는 같다 아니다가 좀 다릅니다
 --> 같다의 경우 = 하나만 쓰고 다르다는 !=, <>, ^= 다 됩니다
 

 -- 조건연산자 and, or 
 -- &&, || -> 보통 이런식으로 표기
 -- but 오라클에서는 and, or 그대로 표기
 
 SELECT *
  FROM emp
 where sal <= 1000 and sal >=3000
  order by sal desc;

 -- in 연산자 (p107)
 -- =으로 되어 있는 조건이며 or 로 많이 묶여있을 경우 사용합니다.
 
 select * 
  from emp
  where sal = 3000 
     or sal = 1000 
     or sal = 2000
     or sal = 3500;     
-- 이럴 때 in 절 등장 

select * 
  from emp
  where sal in (3000,1000,2000,3500); 
  
-- 과제는 92 쪽 문제 전부 풀고 메일로 과제를 보내기   