with Ada.Text_IO; use Ada.Text_IO;

procedure Heap_Sort is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Heapify (Arr : in out Int_Array; N, I : Integer) is
      Largest, L, R, Temp : Integer;
   begin
      Largest := I;
      L := 2 * I;
      R := 2 * I + 1;
      if L <= N and then Arr (L) > Arr (Largest) then
         Largest := L;
      end if;
      if R <= N and then Arr (R) > Arr (Largest) then
         Largest := R;
      end if;
      if Largest /= I then
         Temp := Arr (I);
         Arr (I) := Arr (Largest);
         Arr (Largest) := Temp;
         Heapify (Arr, N, Largest);
      end if;
   end Heapify;

   Data : Int_Array := (5, 3, 8, 1, 9, 2);
   N : constant Integer := Data'Length;
   Temp : Integer;
begin
   for I in reverse 1 .. N / 2 loop
      Heapify (Data, N, I);
   end loop;
   for I in reverse 2 .. N loop
      Temp := Data (1);
      Data (1) := Data (I);
      Data (I) := Temp;
      Heapify (Data, I - 1, 1);
   end loop;
   for Value of Data loop
      Put (Value'Image);
   end loop;
   New_Line;
end Heap_Sort;
