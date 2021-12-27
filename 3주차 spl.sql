--3���� ���� ������
--���� ���� üũ

--���� �������� ������ �κ� 


--As Ű���� ���� ���Ⱑ ������
-->      select ename as �����̸�
--> Ȥ��  select ename �����̸� (����ǥ�� �־ �ǰ� ��� ��)

-- order by
--> ����Ʈ ������ asc��� ��
select * 
    from emp
    order by sal;
    
-- and ������ ���� ���� ����
--> �����Ͱ� ������ �ҿ�ð��� �׸�ŭ Ŀ���� �ð��� ������ �߿���

select *
  from emp
  where sal > 1000 
    and deptno = 30 ;

select *
  from emp
  where deptno = 30 
    and sal > 1000;      
 
 -- and���� ���� �� ���� ����� �Ǵ� �༮���� ���� ���°� �߿���
 
 --���� ���� 1 
 --select ���� from  : ���̺��� ��ȸ�� �� ����ϴ� Ű����
 -- where �� : ���α׷��� ���� if ���� ���
 -- ��������� : ��Ģ���길 ���� 
 -- ��Һ� ������ : >, <, =, !=, <=, <=
 -- not ������ = !=  : ���ڿ��� �� �������� ��� nor �� ���� ����Ѵ�
 -- in ������: =���� ����� �� ������ ���� or���� �������� �� ���
 -- 
select * from emp where not deptno in (30);
select * from emp where deptno != 30;
 
-------------------------------------------------------------------

-- ���� �� �� 
-- between A and B : A�� B���̿� 
-- not between A and B 
-- like : ~�� ����, ~ó�� (�˻��� �� ���� ���Ǵ� ģ��, ���ϵ�ī��)
-- not �������� Ȱ��
-- is null (null���� �ִ��� Ȯ��)
-- ���� ������: ��� ���մϴ�. 




--��  between A and B : A�� B���̿� 
select * from emp
where sal >= 1000 and sal <=3000;
--���� ��ġ���迡 ���� 
select * from emp
where sal between 1000 and 3000;




-- not between A and B 
select * from emp
where sal not between 2000 and 3000;





-- �ڡڡ� 
-- like : ~�� ����, ~ó�� (�˻��� �� ���� ���Ǵ� ģ��, ���ϵ�ī��)
-- �Խñ� ��ȸ�ϴ� ����� ����ų�, ������� �˻� �� �� ���� �����
-- ���ڿ� �˻��� ���� ����ϸ� %�� ��� ���ڵ� ������� �ƹ� ���ڳ� �͵���
-- %A% �̷��� �ϸ� A���� ��� �ٳ��� / A% �ϸ� ���̷� �����ϴ�
select *
  from emp 
  where ename like '%S%';
-- where birth like '00%';  (00��� �˻�)
--���ϵ�ī�� (%) : ��� ���ڵ� ������� �ƹ����ڳ�
--���ϵ�ī�� (_) : � ���ڵ�, �ѱ��� 
select ename
 from emp
 where ename like '__A';
-- �̷����ϸ� ����° ���ڰ� A�� ����� ����


-- �Խ��� ���� �˻� ����
select title, contents
  from board
  where title like '%�˻���%' or
        contents like '%�˻���%'
-- ī�䰰������ �˻��� ���� ���� ���� �˻������ϴ°� 
--���࿡ ���뿡���� �˻��ϸ� title �� --ó���� 




-- not �������� Ȱ��





-- is null (null���� �ƴ��� �����ϴ� ������) (where���� �پ �����ڶ����)
-- �Լ��� where ���� ���� ���� ����
-- null : �ƹ����� ����Ǿ� ���� ���� �� (��ĭ)

select * from emp where comm > 0;
-- ���ڶ� null�� ������ ������ �� ��� null ���� ���ܵ�.

select * from emp
 where comm = null; --null���� ���ڰ� �ƴϹǷ� ����� ����, comm�� ���� ��
--> �ƹ� ����� ������ �ʴ´�
-- �̸� ��ü�ϱ� ���� ���� ���� is null �Ʒ��� �ڵ尡 ���� ����� �ҷ���
select * from emp
 where comm is null;
select * from emp
 where comm is not null;

-- ���� ������: ��� ���մϴ�. 
--> ���η� �ٿ��ִ� ������
select empno, ename, job from emp
union
select * from dept;
-- �߾Ⱦ� �����ϴϱ� (���η� ���̸� ���Ⱑ ����)
-- �����̶�� ģ���� ���߿� ������ ���� ����� ����
-- intersect: ������ ������
--    �� �����ִ� ���̺�� �Ʒ��� �ִ� ���̺��� ����� ��ġ�ϴ� row �� ���
-- ���� : �÷��� ��õǴ� ������ Ÿ���� ���ƾ� �մϴ�.
select empno, ename, job from emp
union
select * from dept;

select empno, ename, job from emp
intersect
select * from dept;


--���� 125~126