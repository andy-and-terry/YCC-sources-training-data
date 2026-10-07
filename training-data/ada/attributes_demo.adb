with Ada.Text_IO; use Ada.Text_IO;

procedure Attributes_Demo is
   type Color is (Red, Green, Blue, Yellow);
   subtype Primary is Color range Red .. Blue;
   Arr : array (3 .. 7) of Integer := (others => 0);
begin
   Put_Line ("Color'First = " & Color'First'Image);
   Put_Line ("Color'Last  = " & Color'Last'Image);
   Put_Line ("Succ(Red)   = " & Color'Succ (Red)'Image);
   Put_Line ("Pred(Blue)  = " & Color'Pred (Blue)'Image);
   Put_Line ("Pos(Blue)   =" & Color'Pos (Blue)'Image);
   Put_Line ("Val(3)      = " & Color'Val (3)'Image);
   Put_Line ("Primary'Last = " & Primary'Last'Image);
   Put_Line ("Arr'Length  =" & Arr'Length'Image);
   Put_Line ("Arr'First   =" & Arr'First'Image);
   Put_Line ("Integer'Max =" & Integer'Max (3, 9)'Image);
   Put_Line ("Color'Value = " & Color'Value ("Green")'Image);
end Attributes_Demo;
