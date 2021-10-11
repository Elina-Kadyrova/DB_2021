WITH
cte_set_A as (
    (select 'a') union all (select 'a') union all (select 'b') union all (select 'c') union all(select 'd')),
cte_set_B as (
    (select 'c') union all (select 'c') union all (select 'd') union all (select 'b')),
cte_numerator_set as (
    (select * from cte_set_A) INTERSECT ALL (select * from cte_set_B)),
cte_denominator_set as (
    (select * from cte_set_A) UNION ALL (select * from cte_set_B)),
cte_numerator_count as (
    select COUNT (*) from cte_numerator_set),
cte_denominator_count as (
    select COUNT (*) from cte_denominator_set)
SELECT (select * from cte_numerator_count)/(select * from cte_denominator_count)::float8;