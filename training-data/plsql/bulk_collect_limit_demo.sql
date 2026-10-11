DECLARE
    CURSOR c_obj IS
        SELECT object_name FROM all_objects WHERE ROWNUM <= 25;
    TYPE name_tab IS TABLE OF all_objects.object_name%TYPE;
    v_names name_tab;
    v_batch PLS_INTEGER := 0;
BEGIN
    OPEN c_obj;
    LOOP
        FETCH c_obj BULK COLLECT INTO v_names LIMIT 10;
        EXIT WHEN v_names.COUNT = 0;
        v_batch := v_batch + 1;
        DBMS_OUTPUT.PUT_LINE('batch ' || v_batch || ' has ' || v_names.COUNT || ' rows');
    END LOOP;
    CLOSE c_obj;
END;
/
