-- Bellman-Ford shortest paths (handles negative weights) using a small
-- weighted-edges table, since PL/SQL has no native graph collection type.
CREATE TABLE bf_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10),
    weight NUMBER
);

INSERT INTO bf_edges VALUES ('a', 'b', -1);
INSERT INTO bf_edges VALUES ('a', 'c', 4);
INSERT INTO bf_edges VALUES ('b', 'c', 3);
INSERT INTO bf_edges VALUES ('b', 'd', 2);
INSERT INTO bf_edges VALUES ('b', 'e', 2);
INSERT INTO bf_edges VALUES ('d', 'b', 1);
INSERT INTO bf_edges VALUES ('d', 'c', 5);
INSERT INTO bf_edges VALUES ('e', 'd', -3);

CREATE OR REPLACE PROCEDURE bellman_ford(p_source IN VARCHAR2) IS
    TYPE dist_table IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    dist dist_table;
    vertex_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO vertex_count FROM (
        SELECT node_from AS node FROM bf_edges
        UNION
        SELECT node_to AS node FROM bf_edges
    );

    dist(p_source) := 0;

    FOR pass IN 1..vertex_count - 1 LOOP
        FOR rec IN (SELECT node_from, node_to, weight FROM bf_edges) LOOP
            IF dist.EXISTS(rec.node_from) THEN
                IF NOT dist.EXISTS(rec.node_to) OR dist(rec.node_from) + rec.weight < dist(rec.node_to) THEN
                    dist(rec.node_to) := dist(rec.node_from) + rec.weight;
                END IF;
            END IF;
        END LOOP;
    END LOOP;

    FOR rec IN (SELECT node_from, node_to, weight FROM bf_edges) LOOP
        IF dist.EXISTS(rec.node_from) AND dist.EXISTS(rec.node_to)
           AND dist(rec.node_from) + rec.weight < dist(rec.node_to) THEN
            RAISE_APPLICATION_ERROR(-20003, 'graph contains a negative-weight cycle');
        END IF;
    END LOOP;

    FOR node_rec IN (
        SELECT node_from AS node FROM bf_edges
        UNION
        SELECT node_to AS node FROM bf_edges
        ORDER BY 1
    ) LOOP
        IF dist.EXISTS(node_rec.node) THEN
            DBMS_OUTPUT.PUT_LINE(node_rec.node || ': ' || dist(node_rec.node));
        END IF;
    END LOOP;
END bellman_ford;
/

BEGIN
    bellman_ford('a');
END;
/
