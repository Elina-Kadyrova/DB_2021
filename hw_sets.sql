SELECT
(select COUNT (*) from (
    ((select 'a') union all (select 'a') union all (select 'b') union all (select 'c') union all(select 'd'))
INTERSECT ALL
    ((select 'c')union all(select 'c')union all(select 'd')union all(select 'b'))
    ) as ONE)
    /
((select COUNT (*) from (
    ((select 'a')union all(select 'a')union all(select 'b')union all(select 'c')union all(select 'd'))
UNION ALL
    ((select 'c')union all(select 'c')union all(select 'd')union all(select 'b'))
    ) as TWO)::float8)