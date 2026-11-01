CREATE OR REPLACE PACKAGE counter_pkg AS
  PROCEDURE inc;
  FUNCTION get RETURN NUMBER;
END counter_pkg;
/
CREATE OR REPLACE PACKAGE BODY counter_pkg AS
  g_count NUMBER := 0;
  PROCEDURE inc IS BEGIN g_count := g_count + 1; END;
  FUNCTION get RETURN NUMBER IS BEGIN RETURN g_count; END;
END counter_pkg;
/
