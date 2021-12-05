create sequence some_customer_seq;
create table some_customer(
    CUSTOMER_ID BIGINT DEFAULT NEXTVAL('some_customer_seq') PRIMARY KEY,
    NAME VARCHAR NOT NULL,
    SURNAME VARCHAR NOT NULL,
    PATRONYMIC VARCHAR NOT NULL,
    ACCOUNT INT NOT NULL
);

create sequence some_order_seq;
create table some_order(
    ORDER_ID BIGINT DEFAULT NEXTVAL('some_order_seq') PRIMARY KEY,
    STATUS_CODE INT NOT NULL,
    CUSTOMER_ID BIGINT NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES some_customer(CUSTOMER_ID)
);

INSERT INTO some_customer(ACCOUNT, NAME, SURNAME, PATRONYMIC)
SELECT FLOOR(RANDOM()*(100000-0)+0),
       'name'||i,
      'surname'||i,
     'patronymic'||i
from generate_series(1,20000) as i;

INSERT INTO some_order(STATUS_CODE, CUSTOMER_ID)
SELECT FLOOR(RANDOM()*(5-1)+1),
       FLOOR(RANDOM()*(20000-1)+1)
from generate_series(1, 20000);

CREATE MATERIALIZED VIEW mv_customer_statistics
AS
    SELECT some_customer.NAME,
        some_customer.SURNAME,
        some_order.ORDER_ID,
        some_order.STATUS_CODE,
        some_customer.ACCOUNT
    from some_customer LEFT JOIN some_order on some_order.CUSTOMER_ID = some_customer.CUSTOMER_ID
GROUP BY NAME, SURNAME, ORDER_ID, STATUS_CODE, ACCOUNT;