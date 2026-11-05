with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Attributes_Slices is
   type Vec is array (Positive range <>) of Integer;
   V : Vec (1 .. 8) := (1, 2, 3, 4, 5, 6, 7, 8);
begin
   Put_Line ("First:" & Integer'Image (V'First));
   Put_Line ("Last:" & Integer'Image (V'Last));
   Put_Line ("Length:" & Integer'Image (V'Length));
   V (2 .. 4) := V (5 .. 7);
   for X of V loop
      Put (Integer'Image (X));
   end loop;
   New_Line;
end Array_Attributes_Slices;
