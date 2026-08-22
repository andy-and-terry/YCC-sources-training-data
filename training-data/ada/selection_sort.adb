with Ada.Text_IO; use Ada.Text_IO;

procedure Selection_Sort is
   type Int_Array is array (Positive range <>) of Integer;
   Data : Int_Array := (64, 25, 12, 22, 11);
   Min_Index, Temp : Integer;
begin
   for I in Data'First .. Data'Last - 1 loop
      Min_Index := I;
      for J in I + 1 .. Data'Last loop
         if Data (J) < Data (Min_Index) then
            Min_Index := J;
         end if;
      end loop;
      Temp := Data (I);
      Data (I) := Data (Min_Index);
      Data (Min_Index) := Temp;
   end loop;
   for Value of Data loop
      Put (Value'Image);
   end loop;
   New_Line;
end Selection_Sort;
