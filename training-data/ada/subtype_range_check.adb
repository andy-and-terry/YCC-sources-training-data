with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Range_Check is
   subtype Percent is Integer range 0 .. 100;
   P : Percent := 100;
begin
   begin
      P := P + 1;
   exception
      when Constraint_Error => Put_Line ("out of range");
   end;
   Put_Line (Integer'Image (P));
end Subtype_Range_Check;
