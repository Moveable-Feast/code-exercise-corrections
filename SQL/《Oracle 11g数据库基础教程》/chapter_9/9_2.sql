-- eg 9.1
declare
    emp_name varchar2(10);
    salary int;
begin
    select ename into emp_name from emp where empno = 7900;
    select sal into salary from emp where empno = 7900;
    dbms_output.put_line(emp_name);
    dbms_output.put_line(salary);
exception
    when no_data_found then
        dbms_output.put_line('There is no such an employee.');
end;