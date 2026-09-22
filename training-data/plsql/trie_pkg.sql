-- A trie encoded without pointers: each edge is keyed by "<node_id>|<char>"
-- in an associative array, since PL/SQL has no native tree/pointer type.
CREATE OR REPLACE PACKAGE trie_pkg IS
    PROCEDURE insert_word(p_word IN VARCHAR2);
    FUNCTION contains_word(p_word IN VARCHAR2) RETURN VARCHAR2;
END trie_pkg;
/

CREATE OR REPLACE PACKAGE BODY trie_pkg IS
    TYPE edge_map IS TABLE OF NUMBER INDEX BY VARCHAR2(50);
    TYPE end_set IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    edges edge_map;
    word_ends end_set;
    next_id NUMBER := 1;

    PROCEDURE insert_word(p_word IN VARCHAR2) IS
        node_id NUMBER := 0;
        edge_key VARCHAR2(50);
        ch VARCHAR2(1);
    BEGIN
        FOR i IN 1..LENGTH(p_word) LOOP
            ch := SUBSTR(p_word, i, 1);
            edge_key := node_id || '|' || ch;
            IF NOT edges.EXISTS(edge_key) THEN
                edges(edge_key) := next_id;
                next_id := next_id + 1;
            END IF;
            node_id := edges(edge_key);
        END LOOP;
        word_ends(node_id) := TRUE;
    END insert_word;

    FUNCTION contains_word(p_word IN VARCHAR2) RETURN VARCHAR2 IS
        node_id NUMBER := 0;
        edge_key VARCHAR2(50);
        ch VARCHAR2(1);
    BEGIN
        FOR i IN 1..LENGTH(p_word) LOOP
            ch := SUBSTR(p_word, i, 1);
            edge_key := node_id || '|' || ch;
            IF NOT edges.EXISTS(edge_key) THEN
                RETURN 'FALSE';
            END IF;
            node_id := edges(edge_key);
        END LOOP;
        IF word_ends.EXISTS(node_id) AND word_ends(node_id) THEN
            RETURN 'TRUE';
        END IF;
        RETURN 'FALSE';
    END contains_word;
END trie_pkg;
/

BEGIN
    trie_pkg.insert_word('cat');
    trie_pkg.insert_word('car');
    DBMS_OUTPUT.PUT_LINE(trie_pkg.contains_word('cat'));
    DBMS_OUTPUT.PUT_LINE(trie_pkg.contains_word('ca'));
    DBMS_OUTPUT.PUT_LINE(trie_pkg.contains_word('car'));
    DBMS_OUTPUT.PUT_LINE(trie_pkg.contains_word('dog'));
END;
/
