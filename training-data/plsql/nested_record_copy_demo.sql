-- User-defined RECORD type, nested record, and record assignment copies.
DECLARE
    TYPE point_t IS RECORD (x NUMBER := 0, y NUMBER := 0);
    TYPE shape_t IS RECORD (name VARCHAR2(20), origin point_t);
    v_s1 shape_t;
    v_s2 shape_t;
BEGIN
    v_s1.name     := 'square';
    v_s1.origin.x := 3;
    v_s1.origin.y := 4;
    v_s2 := v_s1;
    v_s2.origin.x := 10;
    DBMS_OUTPUT.PUT_LINE(v_s1.name || ' at ' || v_s1.origin.x || ',' || v_s1.origin.y);
    DBMS_OUTPUT.PUT_LINE(v_s2.name || ' at ' || v_s2.origin.x || ',' || v_s2.origin.y);
END;
/
