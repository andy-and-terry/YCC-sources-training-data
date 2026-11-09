DECLARE
  TYPE t_rec IS RECORD (name VARCHAR2(30), sal NUMBER);
  FUNCTION get_rec RETURN t_rec IS
    r t_rec;
  BEGIN
    r.name := 'Ann'; r.sal := 5000;
    RETURN r;
  END;
  x t_rec;
BEGIN
  x := get_rec;
  DBMS_OUTPUT.PUT_LINE(x.name || ' ' || x.sal);
END;
/
