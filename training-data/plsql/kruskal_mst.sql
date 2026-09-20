-- Kruskal's minimum spanning tree over a small weighted-edges table,
-- since PL/SQL has no native graph collection type. Edges are processed
-- in ascending weight order and a union-find array (as in union_find.sql)
-- rejects any edge that would close a cycle.
CREATE TABLE kruskal_edges (
    node_from NUMBER,
    node_to NUMBER,
    weight NUMBER
);

INSERT INTO kruskal_edges VALUES (1, 2, 4);
INSERT INTO kruskal_edges VALUES (1, 3, 1);
INSERT INTO kruskal_edges VALUES (2, 3, 2);
INSERT INTO kruskal_edges VALUES (2, 4, 5);
INSERT INTO kruskal_edges VALUES (3, 4, 8);
INSERT INTO kruskal_edges VALUES (3, 5, 10);
INSERT INTO kruskal_edges VALUES (4, 5, 2);

CREATE OR REPLACE TYPE int_table AS TABLE OF NUMBER;
/

CREATE OR REPLACE FUNCTION kf_find(parent IN OUT NOCOPY int_table, x IN NUMBER) RETURN NUMBER IS
BEGIN
    IF parent(x) = x THEN
        RETURN x;
    END IF;
    parent(x) := kf_find(parent, parent(x));
    RETURN parent(x);
END kf_find;
/

CREATE OR REPLACE PROCEDURE kruskal_mst(p_vertex_count IN NUMBER) IS
    parent int_table := int_table();
    total_weight NUMBER := 0;
    edge_count NUMBER := 0;
    root_from NUMBER;
    root_to NUMBER;
BEGIN
    parent.EXTEND(p_vertex_count);
    FOR i IN 1..p_vertex_count LOOP
        parent(i) := i;
    END LOOP;

    FOR rec IN (
        SELECT node_from, node_to, weight
        FROM kruskal_edges
        ORDER BY weight ASC
    ) LOOP
        EXIT WHEN edge_count = p_vertex_count - 1;
        root_from := kf_find(parent, rec.node_from);
        root_to := kf_find(parent, rec.node_to);
        IF root_from != root_to THEN
            parent(root_from) := root_to;
            total_weight := total_weight + rec.weight;
            edge_count := edge_count + 1;
            DBMS_OUTPUT.PUT_LINE('include edge ' || rec.node_from || '-' || rec.node_to || ' (weight ' || rec.weight || ')');
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('total MST weight: ' || total_weight);
END kruskal_mst;
/

BEGIN
    kruskal_mst(5);
END;
/
