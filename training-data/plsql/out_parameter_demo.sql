DECLARE
    v_min NUMBER;
    v_max NUMBER;
    v_count NUMBER := 5;

    PROCEDURE min_max(p_a NUMBER, p_b NUMBER, p_min OUT NUMBER, p_max OUT NUMBER) IS
    BEGIN
        p_min := LEAST(p_a, p_b);
        p_max := GREATEST(p_a, p_b);
    END;

    PROCEDURE bump(p_n IN OUT NUMBER) IS
    BEGIN
        p_n := p_n + 1;
    END;
BEGIN
    min_max(9, 4, v_min, v_max);
    DBMS_OUTPUT.PUT_LINE('min=' || v_min || ' max=' || v_max);
    bump(v_count);
    DBMS_OUTPUT.PUT_LINE('count=' || v_count);
END;
/
