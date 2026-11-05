CREATE OR REPLACE PACKAGE pkg_counter AS
  PROCEDURE bump;
  FUNCTION current_value RETURN NUMBER;
END pkg_counter;
/
CREATE OR REPLACE PACKAGE BODY pkg_counter AS
  g_n NUMBER := 0;
  PROCEDURE bump IS BEGIN g_n := g_n + 1; END;
  FUNCTION current_value RETURN NUMBER IS BEGIN RETURN g_n; END;
END pkg_counter;
/
