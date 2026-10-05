-- Oracle has BITAND only; OR and XOR are derived from it
CREATE OR REPLACE FUNCTION bit_or(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN a + b - BITAND(a, b);
END bit_or;
/

CREATE OR REPLACE FUNCTION bit_xor(a IN NUMBER, b IN NUMBER) RETURN NUMBER IS
BEGIN
    RETURN a + b - 2 * BITAND(a, b);
END bit_xor;
/

DECLARE
    x NUMBER := 12;
    y NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('and: ' || BITAND(x, y));
    DBMS_OUTPUT.PUT_LINE('or:  ' || bit_or(x, y));
    DBMS_OUTPUT.PUT_LINE('xor: ' || bit_xor(x, y));
    DBMS_OUTPUT.PUT_LINE('bit 3 set in 10: ' || CASE WHEN BITAND(10, 8) > 0 THEN 'yes' ELSE 'no' END);
END;
/
