CREATE OR REPLACE FUNCTION reverse_byte(p_value IN NUMBER) RETURN NUMBER IS
    v_v NUMBER := p_value;
    v_r NUMBER := 0;
BEGIN
    FOR i IN 1..8 LOOP
        v_r := v_r * 2 + MOD(v_v, 2);
        v_v := TRUNC(v_v / 2);
    END LOOP;
    RETURN v_r;
END reverse_byte;
/

SELECT column_value AS input, reverse_byte(column_value) AS reversed
FROM TABLE(sys.odcinumberlist(1, 6, 13, 128));
-- 1 -> 128, 6 -> 96, 13 -> 176, 128 -> 1
