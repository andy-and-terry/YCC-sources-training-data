with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Reverse is
   type Int_Array is array (Positive range <>) of Integer;
   Data : Int_Array := (1, 2, 3, 4, 5);
   Temp : Integer;
   Left, Right : Integer;
begin
   Left := Data'First;
   Right := Data'Last;
   while Left < Right loop
      Temp := Data (Left);
      Data (Left) := Data (Right);
      Data (Right) := Temp;
      Left := Left + 1;
      Right := Right - 1;
   end loop;
   for V of Data loop
      Put (V'Image);
   end loop;
   New_Line;
end Array_Reverse;
