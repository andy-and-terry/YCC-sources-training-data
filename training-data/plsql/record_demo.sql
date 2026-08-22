DECLARE
    TYPE point_rec IS RECORD (
        x NUMBER,
        y NUMBER
    );
    p1 point_rec;
    p2 point_rec;
    p3 point_rec;
BEGIN
    p1.x := 1; p1.y := 2;
    p2.x := 3; p2.y := 4;
    p3.x := p1.x + p2.x;
    p3.y := p1.y + p2.y;
    DBMS_OUTPUT.PUT_LINE('(' || p3.x || ', ' || p3.y || ')');
END;
/
