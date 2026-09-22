-- Kruskal's minimum spanning tree over a small weighted-edges table, using
-- a VARCHAR2-indexed associative array as the union-find parent map since
-- PL/SQL has no native graph collection type.
CREATE TABLE mst_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10),
    weight NUMBER
);

INSERT INTO mst_edges VALUES ('a', 'b', 4);
INSERT INTO mst_edges VALUES ('a', 'c', 1);
INSERT INTO mst_edges VALUES ('c', 'b', 2);
INSERT INTO mst_edges VALUES ('b', 'd', 5);
INSERT INTO mst_edges VALUES ('c', 'd', 8);
INSERT INTO mst_edges VALUES ('d', 'e', 3);

CREATE OR REPLACE PACKAGE kruskal_pkg IS
    TYPE parent_map IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10);
    FUNCTION find_root(parent IN OUT NOCOPY parent_map, node IN VARCHAR2) RETURN VARCHAR2;
    PROCEDURE build_mst(p_total OUT NUMBER);
END kruskal_pkg;
/

CREATE OR REPLACE PACKAGE BODY kruskal_pkg IS
    FUNCTION find_root(parent IN OUT NOCOPY parent_map, node IN VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        IF parent(node) = node THEN
            RETURN node;
        END IF;
        parent(node) := find_root(parent, parent(node));
        RETURN parent(node);
    END find_root;

    PROCEDURE build_mst(p_total OUT NUMBER) IS
        parent parent_map;
        root_u VARCHAR2(10);
        root_v VARCHAR2(10);
    BEGIN
        p_total := 0;
        FOR rec IN (
            SELECT DISTINCT node_from AS node FROM mst_edges
            UNION
            SELECT DISTINCT node_to FROM mst_edges
        ) LOOP
            parent(rec.node) := rec.node;
        END LOOP;

        FOR rec IN (SELECT node_from, node_to, weight FROM mst_edges ORDER BY weight) LOOP
            root_u := find_root(parent, rec.node_from);
            root_v := find_root(parent, rec.node_to);
            IF root_u != root_v THEN
                parent(root_u) := root_v;
                p_total := p_total + rec.weight;
                DBMS_OUTPUT.PUT_LINE(rec.node_from || '-' || rec.node_to || ':' || rec.weight);
            END IF;
        END LOOP;
    END build_mst;
END kruskal_pkg;
/

DECLARE
    total NUMBER;
BEGIN
    kruskal_pkg.build_mst(total);
    DBMS_OUTPUT.PUT_LINE('total: ' || total);
END;
/
