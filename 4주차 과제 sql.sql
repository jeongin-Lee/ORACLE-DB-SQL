--1-(1)
select empno,
       rpad(substr(empno, 1,2),4,'*') as MASKING_EMPNO,
       ENAME,
       rpad(substr(ename, 1,1),length(ename),'*') as MASKING_ENAME
       from emp
       where length(ename) = 5;
       
--1-(2)
select empno,
       concat(substr(empno, 1,2),'**') as MASKING_EMPNO,
       ENAME,
       concat(substr(ename, 1,1),'****') as MASKING_ENAME
       from emp
       where length(ename) = 5;       
       
--1-(3)
select empno,
       substr(empno, 1,2)||'**' as MASKING_EMPNO,
       ENAME,
       substr(ename, 1,1)||'****' as MASKING_ENAME
       from emp
       where length(ename) = 5;     
       
 --2
select empno,
       ename,
       sal,
       trunc (SAL/21.5,2) as DAY_PAY,
       round(SAL/(21.5*8),1) as TIME_PAY
       from emp;
       
 --3
 select empno,
        ename,
        replace(hiredate,'/','-'),
        comm
        from emp;