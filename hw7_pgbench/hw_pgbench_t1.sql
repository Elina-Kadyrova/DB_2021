\set id random(1, 10000000)
BEGIN;
SELECT name FROM public.t1 WHERE id = :id;
END;