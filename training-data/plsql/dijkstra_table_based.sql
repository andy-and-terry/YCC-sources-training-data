-- Dijkstra's algorithm using a small weighted-edges table since
-- PL/SQL has no native graph collection type.
CREATE TABLE weighted_edges (
    node_from VARCHAR2(10),
    node_to VARCHAR2(10),
    weight NUMBER
);

INSERT INTO weighted_edges VALUES ('a', 'b', 1);
INSERT INTO weighted_edges VALUES ('a', 'c', 4);
INSERT INTO weighted_edges VALUES ('b', 'c', 2);
INSERT INTO weighted_edges VALUES ('b', 'd', 5);
INSERT INTO weighted_edges VALUES ('c', 'd', 1);

CREATE OR REPLACE FUNCTION shortest_distance(p_source IN VARCHAR2, p_target IN VARCHAR2) RETURN NUMBER IS
    TYPE dist_table IS TABLE OF NUMBER INDEX BY VARCHAR2(10);
    dist dist_table;
BEGIN
    dist(p_source) := 0;
    FOR i IN 1..10 LOOP
        FOR rec IN (SELECT node_from, node_to, weight FROM weighted_edges) LOOP
            IF dist.EXISTS(rec.node_from) THEN
                IF NOT dist.EXISTS(rec.node_to) OR dist(rec.node_from) + rec.weight < dist(rec.node_to) THEN
                    dist(rec.node_to) := dist(rec.node_from) + rec.weight;
                END IF;
            END IF;
        END LOOP;
    END LOOP;
    IF dist.EXISTS(p_target) THEN
        RETURN dist(p_target);
    ELSE
        RETURN -1;
    END IF;
END shortest_distance;
/
