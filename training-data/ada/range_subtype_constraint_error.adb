with Ada.Text_IO; use Ada.Text_IO;
procedure Range_Subtype_Error is
   subtype Percent is Integer range 0 .. 100;
   P : Percent := 50;
begin
   P := P + 60;
   Put_Line ("unreachable");
exception
   when Constraint_Error => Put_Line ("out of range");
end Range_Subtype_Error;
