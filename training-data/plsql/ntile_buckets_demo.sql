-- NTILE splits an ordered result set into N roughly equal buckets.
-- Used here inside a cursor FOR loop over an inline VALUES-style source
-- built from DUAL, so no tables are required.
DECLARE
    CURSOR c_scores IS
        SELECT name, score,
               NTILE(4) OVER (ORDER BY score DESC) AS quartile,
               ROW_NUMBER() OVER (ORDER BY score DESC) AS rn
          FROM (SELECT 'ann'  AS name, 95 AS score FROM dual UNION ALL
                SELECT 'bob',  82 FROM dual UNION ALL
                SELECT 'cy',   77 FROM dual UNION ALL
                SELECT 'dee',  91 FROM dual UNION ALL
                SELECT 'eli',  64 FROM dual UNION ALL
                SELECT 'fay',  88 FROM dual UNION ALL
                SELECT 'gus',  59 FROM dual UNION ALL
                SELECT 'hal',  70 FROM dual UNION ALL
                SELECT 'ivy',  85 FROM dual UNION ALL
                SELECT 'jon',  73 FROM dual)
         ORDER BY rn;
BEGIN
    FOR r IN c_scores LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(r.name, 5) || LPAD(r.score, 4) || '  quartile ' || r.quartile);
    END LOOP;

    -- 10 rows into 4 buckets: the first two buckets get the extra rows
    FOR b IN (SELECT quartile, COUNT(*) AS cnt
                FROM (SELECT NTILE(4) OVER (ORDER BY level) AS quartile
                        FROM dual CONNECT BY level <= 10)
               GROUP BY quartile
               ORDER BY quartile) LOOP
        DBMS_OUTPUT.PUT_LINE('bucket ' || b.quartile || ' has ' || b.cnt || ' rows');
    END LOOP;
END;
/
