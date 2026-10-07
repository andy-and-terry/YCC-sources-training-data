CREATE TABLE sx_items (
    id   NUMBER PRIMARY KEY,
    qty  NUMBER CHECK (qty >= 0)
);

CREATE OR REPLACE PROCEDURE forall_save_exceptions_demo IS
    TYPE num_list IS TABLE OF NUMBER;
    v_ids  num_list := num_list(1, 2, 3, 4);
    v_qtys num_list := num_list(10, -5, 20, -1);
    bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(bulk_errors, -24381);
BEGIN
    FORALL i IN 1 .. v_ids.COUNT SAVE EXCEPTIONS
        INSERT INTO sx_items (id, qty) VALUES (v_ids(i), v_qtys(i));
EXCEPTION
    WHEN bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE('Failed rows: ' || SQL%BULK_EXCEPTIONS.COUNT);
        FOR j IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Index ' || SQL%BULK_EXCEPTIONS(j).ERROR_INDEX ||
                ' error ' || SQL%BULK_EXCEPTIONS(j).ERROR_CODE);
        END LOOP;
END forall_save_exceptions_demo;
/
