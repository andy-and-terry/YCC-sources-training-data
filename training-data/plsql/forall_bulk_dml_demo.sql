CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE TABLE squares_bulk (
    n NUMBER,
    square_val NUMBER
);

CREATE OR REPLACE PROCEDURE bulk_insert_squares(p_count IN NUMBER) IS
    nums int_table := int_table();
    squares int_table := int_table();
BEGIN
    nums.EXTEND(p_count);
    squares.EXTEND(p_count);
    FOR i IN 1..p_count LOOP
        nums(i) := i;
        squares(i) := i * i;
    END LOOP;

    FORALL i IN 1..nums.COUNT
        INSERT INTO squares_bulk (n, square_val) VALUES (nums(i), squares(i));
END bulk_insert_squares;
/

BEGIN
    bulk_insert_squares(5);
    FOR rec IN (SELECT n, square_val FROM squares_bulk ORDER BY n) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.n || '^2 = ' || rec.square_val);
    END LOOP;
END;
/
