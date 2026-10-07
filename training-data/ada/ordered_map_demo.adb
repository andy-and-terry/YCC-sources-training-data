with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Maps;

procedure Ordered_Map_Demo is
   package Int_Maps is new Ada.Containers.Ordered_Maps
     (Key_Type => Integer, Element_Type => String (1 .. 3));
   use Int_Maps;

   M : Map;
   C : Cursor;
begin
   M.Insert (30, "thr");
   M.Insert (10, "one");
   M.Insert (20, "two");

   --  Iteration is in key order
   C := M.First;
   while Has_Element (C) loop
      Put_Line (Integer'Image (Key (C)) & " => " & Element (C));
      Next (C);
   end loop;

   Put_Line ("Floor of 25:" & Integer'Image (Key (M.Floor (25))));
   Put_Line ("Ceiling of 25:" & Integer'Image (Key (M.Ceiling (25))));
end Ordered_Map_Demo;
