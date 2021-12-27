--4���� 
-- �Լ� : �Է°��� ������ ��°��� ����
-- ����Ŭ�� ������ �ִ� ������ �Լ� >> �����Լ�
-- �����Լ��� "�������Լ�" �� "�������Լ�"�� ����. �̹������� ������ �Լ��� ���ؼ� �˾ƺ�
-- �������Լ��� ? > �Ű������� �ϳ��� �Լ� / ����� ��µǴ� ���� �������Դϴ�.
select lower(ename) from emp ;

-- ������ �Լ���? > ������(�÷���ü�ų� �÷��� �Ϻ�)�� �ʿ��ϸ� ����� ��µǴ� ���� �Ѱ��Դϴ�.
select sum(sal) from emp;

--- upper,lower,initcap
--upper: �ҹ��ڰ� �ִ� ���� ��� �빮�ڷ� �ٲ��ִ� �Լ�
select upper(ename) from emp;
--lower: �빮�ڰ� �ִ� ���� ��� �ҹ��ڷ� �ٲ��ִ� �Լ�
select lower (ename) from emp;
--initcap: ù���ڸ� �빮�ڷ� �ٲ��ִ� �Լ�
select initcap (ename) from emp;

--upper, lower ��ģ������ like�� ���ϵ�ī��� �Բ� �˻��� ���� ���Ǵ� �Լ�
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
  where ename = 'SCOTT' ;  --�ҹ��ڷ� ��µ�
  
-- �Է¹��� ��� �� �빮���̰ų� �ҹ����̸� ..?? >>> ���̽��� ������ �ƴ�
 
/* --���� �Խñ� �˻� ����, �� sql�� ��忡 �Էµȴٱ� ���ٴ� �����ϰ��� �ϴ� ���� ���� �����ϴ� ��Ʈ�ѷ��� �Է��ϴ� sql
  select title, content
  from board
  where upper(title) like '%����ڰ� �Է��� ��%' --> �̰��� �ڹٳ� ���̽㰰�� ���ξ��� �빮�ڷ� ��ȯ�� ��
  or upper(content) like  '%����ڰ� �Է��� ��%';  
 */
 
 
 --Dual ����,Dual ���̺�
 --> �ӽ� �����Դϴ�.
 -- ����Ŭ������ ���� -- ����Ŭ�� �������
 -- MY ASQL�� �׳� �Ƚᵵ ��
 -- EMP�� �Ҽ� ���� ���õ�
 select '11111' as name   
 from dual ;
 
 select '11111' as name, '122553' as num 
 from dual;

-- LENGTH�Լ�
-- ���ڿ��� ���̸� ��ȯ�ϴ� �Լ��Դϴ�.
--> ���������� ���̱� ���ٴ� �ٸ� �Լ��� ���� ����
select ename, length(ename)
 from emp;
 
select ename, length(ename)
from emp
where length(ename) >= 6 ;

-- substr() �Լ�
-- ��� ���ڿ��� ����� �� �ִ� ����� �� ���� �ִ� �Լ�
--Ư�� ���ڿ� ���� �Լ�
 -- 'HELLO' substar('HELLO', 1, 2) = 'HE' >> ù���� H ���� H�� ������ �α���
 -- (���ڿ�,����) �� ��� �ش� ���� �ڸ����� ������ ����
 
 select substr('HELLO', 1, 2) 
    from dual;
  
 select job, substr(job,1,2), substr(job,3,2), substr(job,5)
    from emp ;
    
 --��� ���������� �ٷ� �� ������ ģ���Դϴ�.
 
 select substr('970130-1234567',1,6)
 from dual;
 
 --instr�� �Ⱦ��ϱ� �ȴٷ� --�ڹٳ� ���̽㿡�� �� �����ϰ� ���̱� ����
 
 ---replace("���ڿ�������", "��ü�� ���ڿ�", ��ü�� ����") : �����;ȿ� Ư�� ���ڸ� �ٸ� ���ڷ� ��ü�ϴ� �Լ��Դϴ�.
 select replace('10/5','/','-')
  from dual;    
 -- �ø����ȣ�� �����ȣ�Է½� ���� ����
  select replace('10-05','-','')
  from dual;    
  
 -- rpad, lpad : ������, ���ʿ� Ư�����ڿ��� ����� �Լ�
 -- rpad(substr('001008-4155550',1,7),'*',14) => 001008-*******
 -- �������� ������ �����Ǵ� �׸� ó����
 --substr('001008-1111111',1,7) --> '001008-'
 -- rpad,lpad�� rpad('hello', 10, '*') --> *****hello
 -- lpad('hello', 10, '*') --> hello*****
 select rpad(substr('001008-4155550',1,7), 14,'*') --substr(), rpad()�� ���� ����ϴ� �Լ��� ��ǥ
 from dual;
  
 select rpad(substr('001008-4155550',1,7), length('001008-4155550'),'*') 
 from dual; 
 
 select lpad(substr('001008-4155550',7), length('001008-4155550'),'*') 
 from dual; 
 
 -- concat�� �ι��ڿ� �����͸� �����ִ� �Լ��Դϴ�.
 -- concat(A,B) -> concat('aaa','bbb')>> 'aaabbb'
 select concat(substr('001008-1122334',1,7),'*******')
 from dual;
 
 --|| : ��ҿ� ���α׷��ֿ��� ���� ��� or �������Դϴ�.
 -- ���⼭�� ���ڿ��� ��ġ�µ����� ����� �� �ֽ��ϴ�. 
 select substr('001008-4156810',1,7)||'*******'
 from dual;  
 
 --trim : �ȿ� ���ڿ��� ������ ������ �����ݴϴ�. 
 --trim(���ڿ� ������, Ư������) >> Ư�����ڸ� ������
 
 --round �Լ� : �ݿø��Լ�
 --round(1) : �Ҽ��� ��°�ڸ� ���ڿ��� �ݿø��մϴ�.
 select round(28.85,1)
 from dual;
 select round(28.85,0)
 from dual; 
  select round(28.85,-1)
 from dual;  --�Ǽ��ο��� �ݿø� �� �� ������
 
 --trunc : ���� ���� �Լ�
 --round�� �Ȱ����� �ݿø��̾ƴ϶� ��������
 
 -- mod�Լ�
 -- mod�� �������� ���ϴ� �Լ�
 --> 10 % 3 =1 == mod(10,3)
 