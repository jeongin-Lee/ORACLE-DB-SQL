--3�� (NVL2(COMM, COMM,'N/A')�̶�� �Է��ϸ� �ڲ� ������ �ߴµ� ������ �𸣰ڽ��ϴ�.)
select empno,ename, hiredate,
       to_char(NEXT_DAY(ADD_MONTHS(hiredate, 3), '������'), 'yyyy-mm-dd') AS R_JOB,
       NVL2(COMM, 'O','N/A') AS COMM 
from emp;

--4�� ( KING���� 0000�� �����µ� ������ �𸣰ڽ��ϴ�.) 
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
