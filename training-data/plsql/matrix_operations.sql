CREATE OR REPLACE TYPE matrix_row AS TABLE OF NUMBER;
/
CREATE OR REPLACE TYPE matrix_2d AS TABLE OF matrix_row;
/

CREATE OR REPLACE FUNCTION matrix_multiply(a IN matrix_2d, b IN matrix_2d) RETURN matrix_2d IS
    result matrix_2d := matrix_2d();
    sum_val NUMBER;
BEGIN
    result.EXTEND(a.COUNT);
    FOR i IN 1..a.COUNT LOOP
        result(i) := matrix_row();
        result(i).EXTEND(b(1).COUNT);
        FOR j IN 1..b(1).COUNT LOOP
            sum_val := 0;
            FOR k IN 1..a(i).COUNT LOOP
                sum_val := sum_val + a(i)(k) * b(k)(j);
            END LOOP;
            result(i)(j) := sum_val;
        END LOOP;
    END LOOP;
    RETURN result;
END matrix_multiply;
/
