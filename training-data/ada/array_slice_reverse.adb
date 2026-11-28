with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Slice_Reverse is
   type Vec is array (Positive range <>) of Integer;
   V : Vec := (1, 2, 3, 4, 5);
   Tmp : Integer;
begin
   for I in 1 .. V'Length / 2 loop
      Tmp := V (I);
      V (I) := V (V'Last - I + 1);
      V (V'Last - I + 1) := Tmp;
   end loop;
   for E of V loop
      Put (Integer'Image (E));
   end loop;
   New_Line;
end Array_Slice_Reverse;
