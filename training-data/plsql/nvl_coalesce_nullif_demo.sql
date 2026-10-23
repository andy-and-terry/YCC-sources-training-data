SET SERVEROUTPUT ON
DECLARE
  a NUMBER := NULL;
  b NUMBER := NULL;
  c NUMBER := 7;
BEGIN
  DBMS_OUTPUT.PUT_LINE('nvl=' || NVL(a, -1));
  DBMS_OUTPUT.PUT_LINE('coalesce=' || COALESCE(a, b, c));
  DBMS_OUTPUT.PUT_LINE('nullif=' || NVL(TO_CHAR(NULLIF(c, 7)), 'null'));
  DBMS_OUTPUT.PUT_LINE('nvl2=' || NVL2(a, 'set', 'unset'));
END;
/
