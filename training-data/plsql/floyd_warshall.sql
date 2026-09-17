CREATE OR REPLACE TYPE matrix_row AS TABLE OF NUMBER;
/
CREATE OR REPLACE TYPE matrix_2d AS TABLE OF matrix_row;
/

CREATE OR REPLACE FUNCTION floyd_warshall(p_matrix IN matrix_2d) RETURN matrix_2d IS
    dist matrix_2d := matrix_2d();
    n NUMBER := p_matrix.COUNT;
BEGIN
    dist.EXTEND(n);
    FOR i IN 1..n LOOP
        dist(i) := matrix_row();
        dist(i).EXTEND(p_matrix(i).COUNT);
        FOR j IN 1..p_matrix(i).COUNT LOOP
            dist(i)(j) := p_matrix(i)(j);
        END LOOP;
    END LOOP;

    FOR k IN 1..n LOOP
        FOR i IN 1..n LOOP
            FOR j IN 1..n LOOP
                IF dist(i)(k) + dist(k)(j) < dist(i)(j) THEN
                    dist(i)(j) := dist(i)(k) + dist(k)(j);
                END IF;
            END LOOP;
        END LOOP;
    END LOOP;
    RETURN dist;
END floyd_warshall;
/

DECLARE
    inf_val CONSTANT NUMBER := 1000000;
    graph matrix_2d := matrix_2d(
        matrix_row(0, 3, inf_val, 7),
        matrix_row(8, 0, 2, inf_val),
        matrix_row(5, inf_val, 0, 1),
        matrix_row(2, inf_val, inf_val, 0)
    );
    result matrix_2d;
    line_out VARCHAR2(200);
BEGIN
    result := floyd_warshall(graph);
    FOR i IN 1..result.COUNT LOOP
        line_out := '';
        FOR j IN 1..result(i).COUNT LOOP
            IF result(i)(j) >= inf_val THEN
                line_out := line_out || 'INF';
            ELSE
                line_out := line_out || result(i)(j);
            END IF;
            IF j < result(i).COUNT THEN
                line_out := line_out || ',';
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(line_out);
    END LOOP;
END;
/
