with Ada.Text_IO; use Ada.Text_IO;

procedure QuickSort_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Quick_Sort (Arr : in out Int_Array; Low, High : Integer) is
      I, J, Pivot, Temp : Integer;
   begin
      if Low >= High then
         return;
      end if;
      Pivot := Arr ((Low + High) / 2);
      I := Low;
      J := High;
      while I <= J loop
         while Arr (I) < Pivot loop
            I := I + 1;
         end loop;
         while Arr (J) > Pivot loop
            J := J - 1;
         end loop;
         if I <= J then
            Temp := Arr (I);
            Arr (I) := Arr (J);
            Arr (J) := Temp;
            I := I + 1;
            J := J - 1;
         end if;
      end loop;
      Quick_Sort (Arr, Low, J);
      Quick_Sort (Arr, I, High);
   end Quick_Sort;

   Data : Int_Array := (5, 3, 8, 1, 9, 2);
begin
   Quick_Sort (Data, Data'First, Data'Last);
   for Value of Data loop
      Put (Value'Image);
   end loop;
   New_Line;
end QuickSort_Demo;
