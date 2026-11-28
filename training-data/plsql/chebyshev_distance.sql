-- Chebyshev distance between (1,2) and (4,6)
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE(GREATEST(ABS(1 - 4), ABS(2 - 6)));
END;
/
