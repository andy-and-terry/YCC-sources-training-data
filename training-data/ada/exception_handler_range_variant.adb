with Ada.Text_IO; use Ada.Text_IO;

procedure Range_Check_Demo is
   subtype Small is Integer range 1 .. 10;
   X : Small := 5;
begin
   X := X * 3;
   Put_Line ("unreachable? " & Integer'Image (X));
exception
   when Constraint_Error => Put_Line ("out of range");
end Range_Check_Demo;
