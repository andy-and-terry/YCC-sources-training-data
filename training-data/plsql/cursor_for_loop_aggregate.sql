DECLARE
  v_total NUMBER := 0;
BEGIN
  FOR r IN (SELECT level AS n FROM dual CONNECT BY level <= 5) LOOP
    v_total := v_total + r.n;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('total=' || v_total);
END;
/
