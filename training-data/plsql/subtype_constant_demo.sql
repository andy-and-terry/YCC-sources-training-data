DECLARE
    SUBTYPE percent_t IS NUMBER(5, 2) NOT NULL;
    SUBTYPE short_name_t IS VARCHAR2(5);
    SUBTYPE positive_t IS PLS_INTEGER RANGE 1 .. 1000;

    c_tax CONSTANT percent_t := 19.5;
    v_name short_name_t := 'abc';
    v_qty  positive_t := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('tax=' || c_tax || ' name=' || v_name || ' qty=' || v_qty);
    BEGIN
        v_qty := 5000;
    EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('range violated: ' || SQLERRM);
    END;
    BEGIN
        v_name := 'too long name';
    EXCEPTION
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('length violated');
    END;
END;
/
