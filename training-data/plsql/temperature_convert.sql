DECLARE
    FUNCTION c_to_f(c NUMBER) RETURN NUMBER IS BEGIN RETURN c * 9 / 5 + 32; END;
    FUNCTION f_to_c(f NUMBER) RETURN NUMBER IS BEGIN RETURN (f - 32) * 5 / 9; END;
    FUNCTION c_to_k(c NUMBER) RETURN NUMBER IS BEGIN RETURN c + 273.15; END;
BEGIN
    FOR c IN -40 .. 40 LOOP
        IF MOD(c, 20) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(LPAD(c, 4) || ' C = ' || LPAD(TO_CHAR(c_to_f(c), 'FM990.0'), 6) ||
                ' F = ' || TO_CHAR(c_to_k(c), 'FM990.00') || ' K');
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('98.6 F = ' || ROUND(f_to_c(98.6), 1) || ' C');
END;
/
