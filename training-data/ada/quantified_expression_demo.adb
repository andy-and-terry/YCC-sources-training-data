with Ada.Text_IO; use Ada.Text_IO;
procedure Quantified_Expression_Demo is
   A : constant array (1 .. 4) of Integer := (2, 4, 6, 8);
   All_Even : constant Boolean := (for all X of A => X mod 2 = 0);
   Has_Six  : constant Boolean := (for some X of A => X = 6);
begin
   Put_Line (Boolean'Image (All_Even));
   Put_Line (Boolean'Image (Has_Six));
end Quantified_Expression_Demo;
