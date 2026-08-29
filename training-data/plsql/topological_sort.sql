-- Topological sort over a small edges table, since PL/SQL has no
-- native graph/adjacency-list type outside a backing table.
CREATE TABLE graph_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10)
);

INSERT INTO graph_edges VALUES ('a', 'b');
INSERT INTO graph_edges VALUES ('a', 'c');
INSERT INTO graph_edges VALUES ('b', 'd');
INSERT INTO graph_edges VALUES ('c', 'd');

CREATE OR REPLACE PROCEDURE topological_sort IS
    CURSOR order_cursor IS
        SELECT DISTINCT node_from AS node FROM graph_edges
        WHERE node_from NOT IN (SELECT node_to FROM graph_edges)
        UNION
        SELECT DISTINCT node_to FROM graph_edges;
BEGIN
    FOR rec IN order_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(rec.node);
    END LOOP;
END topological_sort;
/
