DECLARE
    TYPE num_array IS TABLE OF NUMBER;
    dims num_array := num_array(40, 20, 30, 10, 30);
    n NUMBER := dims.COUNT - 1;
    TYPE cost_map IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    dp cost_map;
BEGIN
    FOR i IN 1..n LOOP
        dp(i || '_' || i) := 0;
    END LOOP;
    FOR len IN 2..n LOOP
        FOR i IN 1..n - len + 1 LOOP
            DECLARE
                j NUMBER := i + len - 1;
                best NUMBER := NULL;
                cost NUMBER;
            BEGIN
                FOR k IN i..j - 1 LOOP
                    cost := dp(i || '_' || k) + dp((k + 1) || '_' || j)
                            + dims(i) * dims(k + 1) * dims(j + 1);
                    IF best IS NULL OR cost < best THEN
                        best := cost;
                    END IF;
                END LOOP;
                dp(i || '_' || j) := best;
            END;
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(dp('1_' || n));
END;
/
