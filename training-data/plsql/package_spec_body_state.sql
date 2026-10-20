CREATE OR REPLACE PACKAGE counter_pkg AS
    FUNCTION next_val RETURN NUMBER;
    PROCEDURE reset(p_start NUMBER DEFAULT 0);
    c_step CONSTANT NUMBER := 5;
END counter_pkg;
/
CREATE OR REPLACE PACKAGE BODY counter_pkg AS
    g_value NUMBER := 0;
    FUNCTION next_val RETURN NUMBER IS
    BEGIN
        g_value := g_value + c_step;
        RETURN g_value;
    END;
    PROCEDURE reset(p_start NUMBER DEFAULT 0) IS
    BEGIN
        g_value := p_start;
    END;
BEGIN
    g_value := 100;
END counter_pkg;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(counter_pkg.next_val || ' ' || counter_pkg.next_val);
    counter_pkg.reset;
    DBMS_OUTPUT.PUT_LINE(counter_pkg.next_val);
END;
/
