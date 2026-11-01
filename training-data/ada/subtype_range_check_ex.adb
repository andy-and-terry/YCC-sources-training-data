with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Range_Check_Ex is
   subtype Percent is Integer range 0 .. 100;
   P : Percent := 95;
begin
   P := P + 5;
   Put_Line (Percent'Image (P));
   P := P + 1;
   Put_Line ("unreachable");
exception
   when Constraint_Error => Put_Line ("out of range");
end Subtype_Range_Check_Ex;
