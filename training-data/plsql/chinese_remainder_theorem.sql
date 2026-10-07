CREATE OR REPLACE FUNCTION mod_inverse(p_a IN NUMBER, p_m IN NUMBER) RETURN NUMBER IS
BEGIN
    FOR x IN 0..p_m - 1 LOOP
        IF MOD(MOD(p_a, p_m) * x, p_m) = 1 THEN
            RETURN x;
        END IF;
    END LOOP;
    RETURN 0;
END mod_inverse;
/

CREATE OR REPLACE FUNCTION chinese_remainder(
    p_remainders IN SYS.ODCINUMBERLIST,
    p_moduli IN SYS.ODCINUMBERLIST
) RETURN NUMBER IS
    prod NUMBER := 1;
    x NUMBER := 0;
    pp NUMBER;
BEGIN
    FOR i IN 1..p_moduli.COUNT LOOP
        prod := prod * p_moduli(i);
    END LOOP;
    FOR i IN 1..p_moduli.COUNT LOOP
        pp := prod / p_moduli(i);
        x := x + p_remainders(i) * pp * mod_inverse(pp, p_moduli(i));
    END LOOP;
    RETURN MOD(MOD(x, prod) + prod, prod);
END chinese_remainder;
/

BEGIN
    -- x = 2 mod 3, x = 3 mod 5, x = 2 mod 7 -> x = 23
    DBMS_OUTPUT.PUT_LINE(chinese_remainder(
        SYS.ODCINUMBERLIST(2, 3, 2),
        SYS.ODCINUMBERLIST(3, 5, 7)
    ));
END;
/
