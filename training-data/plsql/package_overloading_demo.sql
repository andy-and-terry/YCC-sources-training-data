-- Procedure/function overloading: a package can expose several routines
-- with the same name as long as their parameter lists are distinguishable
-- by type or count.
CREATE OR REPLACE PACKAGE math_ops IS
    FUNCTION add_values(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER;
    FUNCTION add_values(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION add_values(p_a IN NUMBER, p_b IN NUMBER, p_c IN NUMBER) RETURN NUMBER;
END math_ops;
/

CREATE OR REPLACE PACKAGE BODY math_ops IS
    -- overload 1: two numbers
    FUNCTION add_values(p_a IN NUMBER, p_b IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN p_a + p_b;
    END add_values;

    -- overload 2: same name, different parameter types -> string concatenation
    FUNCTION add_values(p_a IN VARCHAR2, p_b IN VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN p_a || p_b;
    END add_values;

    -- overload 3: same name, different parameter count
    FUNCTION add_values(p_a IN NUMBER, p_b IN NUMBER, p_c IN NUMBER) RETURN NUMBER IS
    BEGIN
        RETURN p_a + p_b + p_c;
    END add_values;
END math_ops;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(math_ops.add_values(2, 3));
    DBMS_OUTPUT.PUT_LINE(math_ops.add_values('foo', 'bar'));
    DBMS_OUTPUT.PUT_LINE(math_ops.add_values(1, 2, 3));
END;
/
