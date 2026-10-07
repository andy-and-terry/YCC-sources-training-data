CREATE OR REPLACE TYPE circle_obj AS OBJECT (
    radius NUMBER,
    MEMBER FUNCTION area RETURN NUMBER,
    MEMBER FUNCTION describe RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY circle_obj AS
    MEMBER FUNCTION area RETURN NUMBER IS
    BEGIN
        RETURN 3.14159 * radius * radius;
    END area;

    MEMBER FUNCTION describe RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Circle(r=' || radius || ', area=' || ROUND(area, 2) || ')';
    END describe;
END;
/

CREATE OR REPLACE PROCEDURE print_circle_demo IS
    c circle_obj := circle_obj(5);
BEGIN
    DBMS_OUTPUT.PUT_LINE(c.describe());
END print_circle_demo;
/
