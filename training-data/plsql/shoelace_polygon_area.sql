SET SERVEROUTPUT ON;
DECLARE
  TYPE t_nums IS VARRAY(4) OF NUMBER;
  xs t_nums := t_nums(0, 4, 4, 0);
  ys t_nums := t_nums(0, 0, 3, 3);
  s  NUMBER := 0;
  j  PLS_INTEGER;
BEGIN
  FOR i IN 1 .. 4 LOOP
    j := MOD(i, 4) + 1;
    s := s + xs(i) * ys(j) - xs(j) * ys(i);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Area: ' || ABS(s) / 2);
END;
/
