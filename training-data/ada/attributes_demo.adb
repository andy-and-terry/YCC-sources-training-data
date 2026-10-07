with Ada.Text_IO; use Ada.Text_IO;

procedure Attributes_Demo is
   type Color is (Red, Green, Blue, Yellow);
   subtype Primary is Color range Red .. Blue;
   Arr : array (3 .. 7) of Integer := (others => 0);
begin
   Put_Line ("Color'First = " & Color'Image (Color'First));
   Put_Line ("Color'Last  = " & Color'Image (Color'Last));
   Put_Line ("Succ(Red)   = " & Color'Image (Color'Succ (Red)));
   Put_Line ("Pred(Blue)  = " & Color'Image (Color'Pred (Blue)));
   Put_Line ("Pos(Blue)   =" & Integer'Image (Color'Pos (Blue)));
   Put_Line ("Val(3)      = " & Color'Image (Color'Val (3)));
   Put_Line ("Primary'Last = " & Color'Image (Primary'Last));
   Put_Line ("Arr'Length  =" & Integer'Image (Arr'Length));
   Put_Line ("Arr'First   =" & Integer'Image (Arr'First));
   Put_Line ("Integer'Max =" & Integer'Image (Integer'Max (3, 9)));
   Put_Line ("Color'Value = " & Color'Image (Color'Value ("Green")));
end Attributes_Demo;
