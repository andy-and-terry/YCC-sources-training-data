CREATE SEQUENCE order_seq START WITH 100 INCREMENT BY 10 NOCACHE;

CREATE OR REPLACE PROCEDURE sequence_demo IS
    v_first  NUMBER;
    v_second NUMBER;
BEGIN
    v_first  := order_seq.NEXTVAL;   -- direct assignment is allowed from 11g
    v_second := order_seq.NEXTVAL;
    DBMS_OUTPUT.PUT_LINE('First:  ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Second: ' || v_second);
    DBMS_OUTPUT.PUT_LINE('Current: ' || order_seq.CURRVAL);
END sequence_demo;
/
