-- Greedy sequence whose pairwise sums are all distinct.
SET SERVEROUTPUT ON;
DECLARE
  TYPE t_flags IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
  TYPE t_seq   IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  v_seq   t_seq;
  v_sums  t_flags;
  v_fresh t_flags;
  v_n     PLS_INTEGER := 0;
  v_cand  PLS_INTEGER := 1;
  v_ok    BOOLEAN;
  v_s     PLS_INTEGER;
  v_out   VARCHAR2(200);
BEGIN
  WHILE v_n < 8 LOOP
    v_fresh.DELETE;
    v_ok := TRUE;
    v_seq(v_n + 1) := v_cand;
    FOR i IN 1 .. v_n + 1 LOOP
      v_s := v_seq(i) + v_cand;
      IF v_sums.EXISTS(v_s) OR v_fresh.EXISTS(v_s) THEN
        v_ok := FALSE;
      ELSE
        v_fresh(v_s) := TRUE;
      END IF;
    END LOOP;
    IF v_ok THEN
      v_s := v_fresh.FIRST;
      WHILE v_s IS NOT NULL LOOP
        v_sums(v_s) := TRUE;
        v_s := v_fresh.NEXT(v_s);
      END LOOP;
      v_n := v_n + 1;
    END IF;
    v_cand := v_cand + 1;
  END LOOP;
  FOR i IN 1 .. 8 LOOP
    v_out := v_out || v_seq(i) || ' ';
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(RTRIM(v_out));
END;
/
