--3번 (NVL2(COMM, COMM,'N/A')이라고 입력하면 자꾸 오류가 뜨는데 이유를 모르겠습니다.)
select empno,ename, hiredate,
       to_char(NEXT_DAY(ADD_MONTHS(hiredate, 3), '월요일'), 'yyyy-mm-dd') AS R_JOB,
       NVL2(COMM, 'O','N/A') AS COMM 
from emp;

--4번 ( KING값이 0000이 나오는데 이유를 모르겠습니다.) 
SELECT EMPNO, ENAME, MGR,
        CASE
         WHEN MGR IS NULL THEN 0000
         WHEN substr(MGR, 1,2)= 75 THEN 5555
         WHEN substr(MGR, 1,2)= 76 THEN 6666
         WHEN substr(MGR, 1,2)= 77 THEN 7777
         WHEN substr(MGR, 1,2)= 78 THEN 8888
         ELSE MGR
       END AS CHG_MGR
   FROM EMP;
