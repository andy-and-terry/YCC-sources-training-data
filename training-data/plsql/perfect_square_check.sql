CREATE OR REPLACE FUNCTION is_perfect_square(p_n NUMBER) RETURN BOOLEAN IS
  l_r NUMBER;
BEGIN
  IF p_n < 0 THEN
    RETURN FALSE;
  END IF;
  l_r := ROUND(SQRT(p_n));
  RETURN l_r * l_r = p_n;
END is_perfect_square;
/
