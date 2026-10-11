with Ada.Text_IO; use Ada.Text_IO;

procedure Static_Predicate_Subtype is
   type Color is (Red, Orange, Yellow, Green, Blue, Indigo, Violet);
   subtype Warm is Color with Static_Predicate => Warm in Red | Orange | Yellow;
   subtype Even is Integer with Dynamic_Predicate => Even mod 2 = 0;

   C : Color := Orange;
   N : Even := 8;
begin
   Put_Line (C'Image & " is warm: " & Boolean'Image (C in Warm));
   for W in Warm loop
      Put (W'Image & " ");
   end loop;
   New_Line;
   Put_Line (N'Image);
end Static_Predicate_Subtype;
