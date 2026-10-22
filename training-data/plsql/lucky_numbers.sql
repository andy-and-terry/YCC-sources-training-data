SET SERVEROUTPUT ON

-- Start with odds, then delete every k-th survivor for each surviving k
DECLARE
    TYPE num_list IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    nums num_list;
    n PLS_INTEGER := 0;
    m PLS_INTEGER;
    i PLS_INTEGER := 2;
    step PLS_INTEGER;
    result VARCHAR2(200);
BEGIN
    FOR v IN 1..50 LOOP
        IF MOD(v, 2) = 1 THEN
            n := n + 1;
            nums(n) := v;
        END IF;
    END LOOP;
    WHILE i <= n AND nums(i) <= n LOOP
        step := nums(i);
        m := 0;
        FOR j IN 1..n LOOP
            IF MOD(j, step) <> 0 THEN
                m := m + 1;
                nums(m) := nums(j);
            END IF;
        END LOOP;
        n := m;
        i := i + 1;
    END LOOP;
    FOR j IN 1..n LOOP
        result := result || CASE WHEN j > 1 THEN ' ' END || nums(j);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(result);
END;
/
