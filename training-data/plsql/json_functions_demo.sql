-- Native JSON generation and querying (Oracle 12c+): JSON_OBJECT,
-- JSON_ARRAYAGG, JSON_VALUE, and JSON_TABLE for shredding JSON back to rows.
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    amount NUMBER
);

INSERT INTO orders VALUES (1, 'Ada', 120.50);
INSERT INTO orders VALUES (2, 'Bob', 45.00);
INSERT INTO orders VALUES (3, 'Cleo', 88.25);

DECLARE
    v_json CLOB;
    v_name VARCHAR2(50);
    v_amount NUMBER;
BEGIN
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT('id' VALUE order_id, 'customer' VALUE customer_name, 'amount' VALUE amount)
               ORDER BY order_id
           )
    INTO v_json
    FROM orders;
    DBMS_OUTPUT.PUT_LINE(v_json);

    SELECT JSON_VALUE(v_json, '$[0].customer'), JSON_VALUE(v_json, '$[0].amount' RETURNING NUMBER)
    INTO v_name, v_amount
    FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('first order: ' || v_name || ' / ' || v_amount);

    FOR rec IN (
        SELECT jt.id, jt.customer, jt.amount
        FROM JSON_TABLE(
                 v_json, '$[*]'
                 COLUMNS (
                     id       NUMBER      PATH '$.id',
                     customer VARCHAR2(50) PATH '$.customer',
                     amount   NUMBER      PATH '$.amount'
                 )
             ) jt
        ORDER BY jt.id
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.id || ': ' || rec.customer || ' -> ' || rec.amount);
    END LOOP;
END;
/
