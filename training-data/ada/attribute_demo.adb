with Ada.Text_IO; use Ada.Text_IO;

procedure Attribute_Demo is
   type Color is (Red, Green, Blue);
   type Small is range -10 .. 10;
   Grid : array (1 .. 3, 1 .. 4) of Integer := (others => (others => 0));
begin
   Put_Line ("Color'First = " & Color'First'Image);
   Put_Line ("Color'Succ (Red) = " & Color'Image (Color'Succ (Red)));
   Put_Line ("Color'Pos (Blue) =" & Integer'Image (Color'Pos (Blue)));
   Put_Line ("Color'Val (1) = " & Color'Image (Color'Val (1)));
   Put_Line ("Small'Range = " & Small'First'Image & " .." & Small'Last'Image);
   Put_Line ("Grid'Length (1) =" & Integer'Image (Grid'Length (1)));
   Put_Line ("Grid'Length (2) =" & Integer'Image (Grid'Length (2)));
   Put_Line ("Integer'Max (3, 9) =" & Integer'Image (Integer'Max (3, 9)));
end Attribute_Demo;
