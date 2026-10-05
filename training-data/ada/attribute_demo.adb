with Ada.Text_IO; use Ada.Text_IO;

procedure Attribute_Demo is
   type Color is (Red, Green, Blue);
   Grid : array (1 .. 3, 1 .. 4) of Integer := (others => (others => 0));
begin
   Put_Line ("Integer'First =" & Integer'First'Image);
   Put_Line ("Natural'Last  =" & Natural'Last'Image);
   Put_Line ("Color'Succ (Red) = " & Color'Image (Color'Succ (Red)));
   Put_Line ("Color'Pos (Blue) =" & Color'Pos (Blue)'Image);
   Put_Line ("Color'Value (""Green"") = " & Color'Image (Color'Value ("Green")));
   Put_Line ("Grid'Length (1) =" & Grid'Length (1)'Image);
   Put_Line ("Grid'Length (2) =" & Grid'Length (2)'Image);
   Put_Line ("Grid'Last (2)   =" & Grid'Last (2)'Image);
end Attribute_Demo;
