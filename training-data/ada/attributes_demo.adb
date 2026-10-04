with Ada.Text_IO; use Ada.Text_IO;

procedure Attributes_Demo is
   type Color is (Red, Green, Blue);
   type Digit is range 0 .. 9;
begin
   Put_Line ("Color'First = " & Color'First'Image);
   Put_Line ("Color'Succ(Red) = " & Color'Succ (Red)'Image);
   Put_Line ("Color'Pos(Blue) =" & Integer'Image (Color'Pos (Blue)));
   Put_Line ("Color'Value(""Green"") = " & Color'Image (Color'Value ("Green")));
   Put_Line ("Digit'Last =" & Digit'Last'Image);
   Put_Line ("Integer'Max(3,7) =" & Integer'Max (3, 7)'Image);
   Put_Line ("Natural'Size >= 16: " & Boolean'Image (Natural'Size >= 16));
end Attributes_Demo;
