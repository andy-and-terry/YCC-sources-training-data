-- Sparse nested table showing the collection method suite: EXISTS, FIRST,
-- LAST, NEXT, PRIOR, COUNT and DELETE(index).
CREATE OR REPLACE TYPE sparse_numbers_t AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE collection_methods_demo IS
    v_nums sparse_numbers_t := sparse_numbers_t(10, 20, 30, 40, 50);
    v_idx  NUMBER;
BEGIN
    v_nums.DELETE(2);
    v_nums.DELETE(4);

    DBMS_OUTPUT.PUT_LINE('count after deletes: ' || v_nums.COUNT);
    DBMS_OUTPUT.PUT_LINE('exists(2): ' || CASE WHEN v_nums.EXISTS(2) THEN 'Y' ELSE 'N' END);
    DBMS_OUTPUT.PUT_LINE('exists(3): ' || CASE WHEN v_nums.EXISTS(3) THEN 'Y' ELSE 'N' END);

    v_idx := v_nums.FIRST;
    WHILE v_idx IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('index ' || v_idx || ' = ' || v_nums(v_idx));
        v_idx := v_nums.NEXT(v_idx);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('last index: ' || v_nums.LAST);
    DBMS_OUTPUT.PUT_LINE('prior to last: ' || v_nums.PRIOR(v_nums.LAST));
END collection_methods_demo;
/
