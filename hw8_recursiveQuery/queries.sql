/* RECURSIVE QUERY WITHOUT CYCLE */
with recursive _employees_sub as
    (select name,
            1 as level,
            name::varchar(255) as path
    from employee
    where position = 2
        UNION
    select (select name from employee where employee_id = managers.manager_id),
           (_employees_sub.level + 1) as level,
           (_employees_sub.path || ' <- ' || (select name from employee where employee_id = managers.manager_id))::varchar(255)
               as path
    from managers inner join _employees_sub
        on (select name from employee where employee_id = managers.supervisor_id) = _employees_sub.name
    )
select * from _employees_sub;


/* RECURSIVE QUERY WITH CYCLE */
with recursive _employees_sub as
    (select name,
            1 as level,
            ARRAY[name::varchar(255)] as path,
            false as cycle
    from employee
    where position = 2
        UNION
    select (select name from employee where employee_id = managers.manager_id),
           (_employees_sub.level + 1) as level,
           (_employees_sub.path || (select name from employee where employee_id = managers.manager_id))::varchar(255)[] as path,
           (select name from employee where employee_id = managers.manager_id) = ANY(_employees_sub.path) as cycle
    from managers inner join _employees_sub
        on (select name from employee where employee_id = managers.supervisor_id) = _employees_sub.name AND NOT CYCLE
    )
select * from _employees_sub;