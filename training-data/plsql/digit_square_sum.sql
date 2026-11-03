CREATE OR REPLACE FUNCTION digit_square_sum(p_n PLS_INTEGER) RETURN PLS_INTEGER IS
  l_m   PLS_INTEGER := ABS(p_n);
  l_sum PLS_INTEGER := 0;
  l_d   PLS_INTEGER;
BEGIN
  WHILE l_m > 0 LOOP
    l_d   := MOD(l_m, 10);
    l_sum := l_sum + l_d * l_d;
    l_m   := TRUNC(l_m / 10);
  END LOOP;
  RETURN l_sum;
END digit_square_sum;
/
