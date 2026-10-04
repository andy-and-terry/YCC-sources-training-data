with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Constraint_Demo is
   subtype Percent is Integer range 0 .. 100;
   subtype Small_Positive is Positive range 1 .. 9;
   P : Percent := 50;
   Raw : Integer := 120;
begin
   Put_Line ("P =" & P'Image);
   Put_Line ("Small_Positive'Last =" & Small_Positive'Last'Image);
   P := Raw;
   Put_Line ("unreachable");
exception
   when Constraint_Error =>
      Put_Line ("Constraint_Error: value out of range");
end Subtype_Constraint_Demo;
