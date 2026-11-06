-- Integer (1..3999) to Roman numeral; Oracle also offers TO_CHAR(n, 'RN').
SET SERVEROUTPUT ON;
DECLARE
  TYPE int_list IS VARRAY(13) OF PLS_INTEGER;
  TYPE str_list IS VARRAY(13) OF VARCHAR2(2);
  vals int_list := int_list(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1);
  syms str_list := str_list('M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I');

  FUNCTION to_roman(p_number PLS_INTEGER) RETURN VARCHAR2 IS
    n   PLS_INTEGER := p_number;
    res VARCHAR2(30);
  BEGIN
    FOR i IN 1 .. vals.COUNT LOOP
      WHILE n >= vals(i) LOOP
        res := res || syms(i);
        n := n - vals(i);
      END LOOP;
    END LOOP;
    RETURN res;
  END to_roman;
BEGIN
  DBMS_OUTPUT.PUT_LINE(to_roman(1994) || ' ' || to_roman(58));
END;
/
