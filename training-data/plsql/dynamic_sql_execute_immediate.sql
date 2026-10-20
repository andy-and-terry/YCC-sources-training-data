DECLARE
    v_count NUMBER;
    v_name  VARCHAR2(30);
    v_table VARCHAR2(30) := 'DUAL';
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || DBMS_ASSERT.SIMPLE_SQL_NAME(v_table) INTO v_count;
    DBMS_OUTPUT.PUT_LINE('rows ' || v_count);
    EXECUTE IMMEDIATE 'SELECT :1 + :2 FROM dual' INTO v_count USING 3, 4;
    DBMS_OUTPUT.PUT_LINE('sum ' || v_count);
    EXECUTE IMMEDIATE 'CREATE TABLE tmp_demo (id NUMBER)';
    EXECUTE IMMEDIATE 'INSERT INTO tmp_demo VALUES (:v)' USING 42;
    EXECUTE IMMEDIATE 'SELECT id FROM tmp_demo' INTO v_count;
    DBMS_OUTPUT.PUT_LINE('id ' || v_count);
    EXECUTE IMMEDIATE 'DROP TABLE tmp_demo PURGE';
    DECLARE
        c SYS_REFCURSOR;
    BEGIN
        OPEN c FOR 'SELECT dummy FROM dual WHERE dummy = :d' USING 'X';
        FETCH c INTO v_name;
        CLOSE c;
        DBMS_OUTPUT.PUT_LINE(v_name);
    END;
END;
/
