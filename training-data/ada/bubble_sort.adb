with Ada.Text_IO; use Ada.Text_IO;

procedure Bubble_Sort is
   type Int_Array is array (Positive range <>) of Integer;
   Data : Int_Array := (5, 2, 9, 1, 5, 6);
   Temp : Integer;
begin
   for I in Data'First .. Data'Last - 1 loop
      for J in Data'First .. Data'Last - I loop
         if Data (J) > Data (J + 1) then
            Temp := Data (J);
            Data (J) := Data (J + 1);
            Data (J + 1) := Temp;
         end if;
      end loop;
   end loop;
   for Value of Data loop
      Put (Value'Image);
   end loop;
   New_Line;
end Bubble_Sort;
