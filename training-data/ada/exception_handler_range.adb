with Ada.Text_IO; use Ada.Text_IO;
procedure Exception_Handler_Range is
   subtype Percent is Integer range 0 .. 100;
   P : Percent;
   function Make (N : Integer) return Percent is begin return N; end Make;
begin
   P := Make (50);
   P := Make (150);
   Put_Line ("unreachable");
exception
   when Constraint_Error => Put_Line ("out of range");
end Exception_Handler_Range;
