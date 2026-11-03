CREATE OR REPLACE FUNCTION count_primes_below(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
  TYPE t_flags IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
  l_composite t_flags;
  l_count     PLS_INTEGER := 0;
  l_j         PLS_INTEGER;
BEGIN
  FOR i IN 2 .. p_n - 1 LOOP
    IF NOT l_composite.EXISTS(i) THEN
      l_count := l_count + 1;
      l_j := i * i;
      WHILE l_j < p_n LOOP
        l_composite(l_j) := TRUE;
        l_j := l_j + i;
      END LOOP;
    END IF;
  END LOOP;
  RETURN l_count;
END count_primes_below;
/
