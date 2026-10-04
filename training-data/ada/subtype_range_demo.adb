with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Range_Demo is
   subtype Percent is Integer range 0 .. 100;
   subtype Weekday is Integer range 1 .. 5;

   P : Percent := 95;
begin
   Put_Line ("Percent first/last:" & Percent'First'Image & Percent'Last'Image);
   Put_Line ("Weekday count:" & Integer'Image (Weekday'Last - Weekday'First + 1));
   P := P + 10;
   Put_Line ("Not reached");
exception
   when Constraint_Error =>
      Put_Line ("Constraint_Error: value out of range for Percent");
end Subtype_Range_Demo;
