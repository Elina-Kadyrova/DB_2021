drop table student;
drop sequence student_seq;
create sequence student_seq;
create table student (
    ID BIGINT DEFAULT NEXTVAL('student_seq') PRIMARY KEY,
    NAME VARCHAR NOT NULL,
    SOMENUM INT NOT NULL
);

INSERT INTO student(SOMENUM, NAME)
SELECT FLOOR(RANDOM()*(100000-0)+0),
       'name'||i
from generate_series(1,19999999) as i;
select count(*) from student;
