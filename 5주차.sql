--5����

-- 1) ��¥ �����͡ڡڡ�
--   ��� DB���� �ٷ�� �ſ� �߿��� ��¥ ���� ������ �Դϴ�.
--    ���� �ٷ� ��¥ ������ ���� �߿��դ���.

--SYSDATE �Լ�: ���� ��¥�� ����ϴ� �Լ���. �ٸ� �Ű������� �ʿ� ���� ������ ��ȣ�� �ʿ� ����.
SELECT SYSDATE AS NOW,
       SYSDATE+1 AS TOMORROW, 
       SYSDATE-1 AS YETERDAY
    FROM DUAL;
 
-- ADD_MONTHS �Լ� : Ư�� ��¥���� �� ������ ���� ��¥�� ����ϴ� �Լ�
-- Ư¡ : �Ѵ��� ��¥���� �ݿ��Ͽ� 30��,31��, ������ �ִ� �޵� ��Ȯ�� �������.
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
   FROM DUAL;

-- MONTHS_BETWEEN �Լ� : �� ��¥���� �󸶳� ���� ���� ���̰� ������ �˷��ִ� �Լ��Դϴ�.
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS months3
  FROM EMP;     
 -- ��ǻ�Ϳ��� ��¥ ������ �ϴ� ����� �����Դϴ�. ���� ��¥�� �� ���� �����̹Ƿ� MPNTHS1 ���� ������ �� 
 -- ���� �ð��� ��¥�� �Ҽ��� ������ ������ TRUNC�� �Բ� ���� ����
 
 
--NEXT_DAY �Լ� : ������ ��¥�κ��� ���ƿ��� ���� ������ ������ ��¥�� �����.
SELECT NEXT_DAY(SYSDATE+3, '������')
 FROM DUAL;
 
 --LAST_DAY �Լ� : ������ ��¥�� ���� ���� ������ ���� ����ϴ� �Լ��Դϴ�.
 SELECT LAST_DAY(SYSDATE)
  FROM DUAL;
  
 --- ������ Ÿ���� ū 3�з� : NUMBER, CHAR, DATE
 -- ����ȯ �Լ� : int("123456")<���̽� , parse_int("123456")<java
 select to_number('123456')
  from DUAL;
 
SELECT TO_char(123456)
 from dual;
 
-- yyyy,mm,dd ���� ��¥ �����̶�� �Ѵ�. 
-- �ٸ� ���� �ٸ��� ���� mi�� ǥ���Ѵ� (hh-mi-ss)
--(���� sysdate�� �ð����� �����µ� �̰� ���ַ��� ����ȯ�� ����ϱ⵵ �Ѵ�.)
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
  
 -- 2) NULL ó�� �Լ�
 -- NULL ó�� ������ IS NULL
 -- NULL ó�� �Լ� : where�� �Ӹ� �ƴ϶� select �������� �� ���Դϴ�.
 
 -- NVL : NULL �� ó�� �Լ��Դϴ�.
 -- NVL(�÷���, �÷��� �ִ� ���� null�̸� ó���� ����) : �� ���� ó���ϴµ� ȿ�������� ����.
/*
   if (a == null)
   {
        a = 0;
    }
*/
 SELECT EMPNO,ENAME,SAL, COMM, SAL+COMM, NVL(COMM, 0), SAL+NVL(COMM,0)
  FROM EMP;
-- NVL2  
-- NVL2 : NVL2(������ �÷��� ����, (�ΰ��� �ƴϸ� ��µ� ���ڳ� ���ڿ�), (�ΰ��� ������ ��µ� ���ڳ� ���ڿ�))
-- ���϶��� ���� �ƴҶ��� ���� �����ؼ� ó���� �� �ִ�.
-- NVL �Լ��� ���� �� ���� ���δ�.
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
 
-- DECODE() �Լ� :
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
SWITCH CASE ���� DECODE �Լ��� ����ϴٶ�� ���� �� �� �ֽ��ϴ�.
������ �ƴ϶� ��ġ�ؾ߸� ���ǿ� ���� ������ SAL>500 �� ������ �� �� ���� 
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

--CASE �Լ�
-- IF ���� ���� ���� �Լ� DECODE�� �޸� ��ġ���� �ʾƵ� ������.
-- (1) ���� decode���� case������
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
         WHEN COMM IS NULL THEN '�ش���� ����'
         WHEN COMM = 0 THEN '���� ����'
         WHEN COMM > 0 THEN '���� : ' || COMM
       END AS COMM_TEXT
   FROM EMP;
-- ���� ����ó�� ���⼺�� ���� �ڵ�� �ۼ��ϱ� ���ؼ��� CASE �ڿ� �÷����� �ۼ��ϸ� �ȵ˴ϴ�.  
-- �Լ��� ��ȣ�� �Ἥ ���� ǥ���Ѵٰ� ����
-- ���� ��ǻ�� ���п����� ��ȯ���� �ʴ� �Լ��� void�� �����Ͽ� () �Ű������� ���� �� �� �־���
-- �׷��� c++�̳� �ٸ� ����� �Լ��� ȣ��� ��ȣ()�� �� �ٿ��� �մϴ�.
--������ ����Ŭ������ ���� �ȿ� ���� �� �ʿ䰡 ���� �Լ��� ��ȣ�� �ٿ��� ǥ������ �ʽ��ϴ�.


-- ���� 175�� !  ! ! ! 