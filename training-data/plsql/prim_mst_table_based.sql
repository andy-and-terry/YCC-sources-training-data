-- Prim's algorithm using an adjacency-matrix-backed collection since
-- PL/SQL has no native 2D graph type.
DECLARE
    TYPE matrix_row IS TABLE OF NUMBER;
    graph matrix_row := matrix_row(
        0, 2, 0, 6, 0,
        2, 0, 3, 8, 5,
        0, 3, 0, 0, 7,
        6, 8, 0, 0, 9,
        0, 5, 7, 9, 0
    );
    n NUMBER := 5;
    TYPE num_map IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    key_ num_map;
    in_mst num_map;
    total NUMBER := 0;
    u NUMBER;

    FUNCTION w(i IN NUMBER, j IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN graph(i * n + j + 1);
    END w;
BEGIN
    FOR i IN 0..n - 1 LOOP
        key_(i) := 999999;
        in_mst(i) := 0;
    END LOOP;
    key_(0) := 0;

    FOR cnt IN 0..n - 1 LOOP
        u := -1;
        FOR v IN 0..n - 1 LOOP
            IF in_mst(v) = 0 AND (u = -1 OR key_(v) < key_(u)) THEN
                u := v;
            END IF;
        END LOOP;
        in_mst(u) := 1;
        total := total + key_(u);
        FOR v IN 0..n - 1 LOOP
            IF w(u, v) != 0 AND in_mst(v) = 0 AND w(u, v) < key_(v) THEN
                key_(v) := w(u, v);
            END IF;
        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(total);
END;
/
