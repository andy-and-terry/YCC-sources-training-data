-- Prim's minimum spanning tree: grow one tree from a start node, always
-- adding the cheapest edge that connects an outside node, over an
-- undirected edges table (PL/SQL has no native graph collection type).
CREATE TABLE prim_edges (
    node_a VARCHAR2(10),
    node_b VARCHAR2(10),
    weight NUMBER
);

INSERT INTO prim_edges VALUES ('0', '1', 2);
INSERT INTO prim_edges VALUES ('0', '3', 6);
INSERT INTO prim_edges VALUES ('1', '2', 3);
INSERT INTO prim_edges VALUES ('1', '3', 8);
INSERT INTO prim_edges VALUES ('1', '4', 5);
INSERT INTO prim_edges VALUES ('2', '4', 7);
INSERT INTO prim_edges VALUES ('3', '4', 9);

CREATE OR REPLACE PACKAGE prim_pkg IS
    PROCEDURE run;
END prim_pkg;
/

CREATE OR REPLACE PACKAGE BODY prim_pkg IS
    TYPE bool_map IS TABLE OF BOOLEAN INDEX BY VARCHAR2(10);
    TYPE num_map IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    TYPE str_map IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10);
    TYPE str_list IS TABLE OF VARCHAR2(10);

    c_infinity CONSTANT NUMBER := 1000000000;

    PROCEDURE run IS
        v_nodes str_list := str_list('0', '1', '2', '3', '4');
        in_mst bool_map;
        min_edge num_map;
        parent str_map;
        u VARCHAR2(10);
        total NUMBER := 0;
    BEGIN
        FOR i IN 1..v_nodes.COUNT LOOP
            min_edge(v_nodes(i)) := c_infinity;
        END LOOP;
        min_edge(v_nodes(1)) := 0;

        FOR round IN 1..v_nodes.COUNT LOOP
            u := NULL;
            FOR i IN 1..v_nodes.COUNT LOOP
                IF NOT in_mst.EXISTS(v_nodes(i)) THEN
                    IF u IS NULL OR min_edge(v_nodes(i)) < min_edge(u) THEN
                        u := v_nodes(i);
                    END IF;
                END IF;
            END LOOP;

            in_mst(u) := TRUE;
            total := total + min_edge(u);
            IF parent.EXISTS(u) THEN
                DBMS_OUTPUT.PUT_LINE(parent(u) || ' - ' || u || ' : ' || min_edge(u));
            END IF;

            FOR rec IN (
                SELECT node_b AS neighbor, weight FROM prim_edges WHERE node_a = u
                UNION ALL
                SELECT node_a AS neighbor, weight FROM prim_edges WHERE node_b = u
            ) LOOP
                IF NOT in_mst.EXISTS(rec.neighbor) AND rec.weight < min_edge(rec.neighbor) THEN
                    min_edge(rec.neighbor) := rec.weight;
                    parent(rec.neighbor) := u;
                END IF;
            END LOOP;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('total: ' || total);
    END run;
END prim_pkg;
/

BEGIN
    prim_pkg.run;
END;
/
