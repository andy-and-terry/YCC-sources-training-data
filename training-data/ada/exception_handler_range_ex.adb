with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Handler_Range_Ex is
   subtype Percent is Integer range 0 .. 100;
   P : Percent;
begin
   P := Percent (Integer'Value ("150"));
   Put_Line ("unreachable");
exception
   when Constraint_Error => Put_Line ("out of range");
end Exception_Handler_Range_Ex;
