CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION uf_find(parent IN OUT NOCOPY int_table, x IN NUMBER) RETURN NUMBER IS
BEGIN
    IF parent(x) = x THEN
        RETURN x;
    END IF;
    RETURN uf_find(parent, parent(x));
END uf_find;
/

CREATE OR REPLACE PROCEDURE uf_union(parent IN OUT NOCOPY int_table, x IN NUMBER, y IN NUMBER) IS
    root_x NUMBER;
    root_y NUMBER;
BEGIN
    root_x := uf_find(parent, x);
    root_y := uf_find(parent, y);
    IF root_x != root_y THEN
        parent(root_x) := root_y;
    END IF;
END uf_union;
/
