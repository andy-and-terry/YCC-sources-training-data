SET SERVEROUTPUT ON
DECLARE
  TYPE point_t IS RECORD (x NUMBER := 0, y NUMBER := 0);
  p point_t;
  q point_t;
BEGIN
  p.x := 3;
  p.y := 4;
  q := p;
  q.x := 10;
  DBMS_OUTPUT.PUT_LINE('p=(' || p.x || ',' || p.y || ') q=(' || q.x || ',' || q.y || ')');
  DBMS_OUTPUT.PUT_LINE('dist=' || SQRT(p.x * p.x + p.y * p.y));
END;
/
