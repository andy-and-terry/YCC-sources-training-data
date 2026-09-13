with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Slice_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   Data   : Int_Array (1 .. 10) := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   Middle : constant Int_Array (1 .. 4) := Data (4 .. 7);
begin
   for V of Middle loop
      Put (V'Image);
   end loop;
   New_Line;

   Data (2 .. 5) := (0, 0, 0, 0);
   for V of Data loop
      Put (V'Image);
   end loop;
   New_Line;
end Array_Slice_Demo;
