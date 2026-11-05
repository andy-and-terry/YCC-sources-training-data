DECLARE
  TYPE t_rec IS RECORD (id NUMBER, label VARCHAR2(20));
  r t_rec;
BEGIN
  r.id := 7;
  r.label := 'seven';
  DBMS_OUTPUT.PUT_LINE(r.id || ' ' || r.label);
END;
/
