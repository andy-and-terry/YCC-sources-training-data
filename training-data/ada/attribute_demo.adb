with Ada.Text_IO; use Ada.Text_IO;

procedure Attribute_Demo is
   type Color is (Red, Green, Blue, Yellow);
   type Table is array (-2 .. 2) of Integer;
   T : Table := (others => 0);
begin
   Put_Line ("Color'First  = " & Color'Image (Color'First));
   Put_Line ("Color'Last   = " & Color'Image (Color'Last));
   Put_Line ("Succ (Red)   = " & Color'Image (Color'Succ (Red)));
   Put_Line ("Pred (Blue)  = " & Color'Image (Color'Pred (Blue)));
   Put_Line ("Pos (Yellow) =" & Natural'Image (Color'Pos (Yellow)));
   Put_Line ("Val (1)      = " & Color'Image (Color'Val (1)));
   Put_Line ("Value (""Blue"") = " & Color'Image (Color'Value ("Blue")));

   Put_Line ("Table'First  =" & Table'First'Image);
   Put_Line ("Table'Last   =" & Table'Last'Image);
   Put_Line ("Table'Length =" & Table'Length'Image);
   Put_Line ("Integer'Max  =" & Integer'Max (3, 9)'Image);
   Put_Line ("Integer'Last =" & Integer'Last'Image);
   Put_Line ("Natural'Min  =" & Natural'Min (3, 9)'Image);
   T (T'First) := 1;
   Put_Line ("T (T'First)  =" & T (T'First)'Image);
end Attribute_Demo;
