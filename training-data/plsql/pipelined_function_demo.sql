CREATE OR REPLACE TYPE number_row AS OBJECT (
    n NUMBER
);
/

CREATE OR REPLACE TYPE number_table AS TABLE OF number_row;
/

CREATE OR REPLACE FUNCTION fibonacci_stream(p_count IN NUMBER) RETURN number_table PIPELINED IS
    v_a NUMBER := 0;
    v_b NUMBER := 1;
    v_next NUMBER;
BEGIN
    FOR i IN 1..p_count LOOP
        PIPE ROW (number_row(v_a));
        v_next := v_a + v_b;
        v_a := v_b;
        v_b := v_next;
    END LOOP;
    RETURN;
END fibonacci_stream;
/

CREATE OR REPLACE PROCEDURE print_fibonacci_stream(p_count IN NUMBER) IS
BEGIN
    FOR rec IN (SELECT n FROM TABLE(fibonacci_stream(p_count))) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.n);
    END LOOP;
END print_fibonacci_stream;
/
