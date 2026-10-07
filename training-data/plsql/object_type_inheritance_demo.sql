-- Object type inheritance via NOT FINAL / UNDER, with member function
-- overriding.
CREATE OR REPLACE TYPE shape_t AS OBJECT (
    name VARCHAR2(30),
    MEMBER FUNCTION area RETURN NUMBER,
    MEMBER FUNCTION describe RETURN VARCHAR2
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY shape_t AS
    MEMBER FUNCTION area RETURN NUMBER IS
    BEGIN
        RETURN 0;
    END area;

    MEMBER FUNCTION describe RETURN VARCHAR2 IS
    BEGIN
        RETURN name || ' has area ' || area();
    END describe;
END;
/

CREATE OR REPLACE TYPE circle_t UNDER shape_t (
    radius NUMBER,
    OVERRIDING MEMBER FUNCTION area RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY circle_t AS
    OVERRIDING MEMBER FUNCTION area RETURN NUMBER IS
    BEGIN
        RETURN 3.14159 * radius * radius;
    END area;
END;
/

DECLARE
    v_shape  shape_t := shape_t('generic');
    v_circle shape_t := circle_t('circle', 4);
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_shape.describe());
    DBMS_OUTPUT.PUT_LINE(v_circle.describe());
END;
/
