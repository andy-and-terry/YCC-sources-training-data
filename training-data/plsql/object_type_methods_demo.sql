CREATE OR REPLACE TYPE rectangle_t AS OBJECT (
    width NUMBER,
    height NUMBER,
    MEMBER FUNCTION area RETURN NUMBER,
    MEMBER FUNCTION perimeter RETURN NUMBER,
    MEMBER FUNCTION describe RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY rectangle_t AS
    MEMBER FUNCTION area RETURN NUMBER IS
    BEGIN
        RETURN width * height;
    END area;

    MEMBER FUNCTION perimeter RETURN NUMBER IS
    BEGIN
        RETURN 2 * (width + height);
    END perimeter;

    MEMBER FUNCTION describe RETURN VARCHAR2 IS
    BEGIN
        RETURN width || 'x' || height || ' rectangle, area=' || area() || ', perimeter=' || perimeter();
    END describe;
END;
/

DECLARE
    r rectangle_t := rectangle_t(4, 6);
BEGIN
    DBMS_OUTPUT.PUT_LINE(r.describe());
END;
/
