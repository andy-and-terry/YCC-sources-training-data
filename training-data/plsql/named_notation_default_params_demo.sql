DECLARE
    FUNCTION make_label(
        p_text   VARCHAR2,
        p_width  PLS_INTEGER := 12,
        p_pad    VARCHAR2    := '.',
        p_upper  BOOLEAN     := FALSE
    ) RETURN VARCHAR2 IS
        v_text VARCHAR2(100) := p_text;
    BEGIN
        IF p_upper THEN v_text := UPPER(v_text); END IF;
        RETURN RPAD(v_text, p_width, p_pad) || '|';
    END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(make_label('name'));
    DBMS_OUTPUT.PUT_LINE(make_label('name', 8));
    DBMS_OUTPUT.PUT_LINE(make_label('name', p_upper => TRUE));
    DBMS_OUTPUT.PUT_LINE(make_label(p_pad => '-', p_text => 'id', p_width => 6));
END;
/
