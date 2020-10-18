-- 2주차 과제 (이정인)
/*
Q1. SELECT 문의 기본 구성 중 하나인 <<SELECT>> 절에는 조회 할 열 또는
여러 열의 조합, 연산식을 지정합니다. 그리고 <<FROM>> 절에는 조회할 데이터가 저장된 테이블
이름을 명시합니다. 만약 명시된 열 이름이 너무 길다면 별도 이름을 지정할 수 있으며 
이름 <<별칭>>이라고 합니다.
*/

/*
Q2. 오른쪽과 같은 결과가 나오도록 EMP 테이블의 JOB 열 데이터를 중복없이 출력해보세요.
*/
SELECT distinct job from EMP;

/*
Q3. 다음의 모든 조건을 만족하는 SQL 문을 작성해보세요.

조건 1) 조회할 테이블은 EMP 테이블이며 모든 열을 출력합니다.
조건 2) 출력되는 열의 별칭은 다음과 같습니다.
조건 3) 부서번호를 기준으로 내림차순으로 정렬하되 부서번호가 같다면 사워 이름을 기준으로 정렬합니다.
*/

SELECT EMPNO AS "EMPLOYEE_NO", ENAME AS "EMPLOYEE_NAME", JOB, 
       MGR AS "MANAGER", HIREDATE, SAL AS "SALARY", 
       COMM AS "COMMISSION", DEPTNO AS "DEPARTMENT_NO"
 FROM EMP 
 ORDER BY DEPTNO DESC, ENAME ASC ;
 
  