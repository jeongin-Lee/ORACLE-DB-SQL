--1
select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  from emp
  where ename like '%S';
  
--2
select EMPNO, ENAME, JOB, SAL, DEPTNO
  from emp
  where DEPTNO = 30  
  and JOB = 'SALESMAN';
  
  --3
select EMPNO, ENAME, JOB, SAL, DEPTNO
   from emp
   where DEPTNO in (20,30)
   AND SAL > 2000;
   
select empno, ename, job, SAL, DEPTNO from emp
where deptno in(20,30)
intersect
select empno, ename, job, SAL, DEPTNO from emp
where sal > 2000;

--4
select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
   from emp
   where sal<2000 or sal>3000 ;  
   
--5
select ename, empno, sal, deptno
    from emp
    where deptno = 30 
    and ename like '%E%'
    and sal not between 1000 and 2000;
    
    
 --6
 select empno, ename, job, mgr, hiredate, sal, comm, deptno 
 from emp
 where COMM is null 
 and MGR is not null
 and job in ('MANAGER','CLERK')
 and ename NOT like '_L%' ;   