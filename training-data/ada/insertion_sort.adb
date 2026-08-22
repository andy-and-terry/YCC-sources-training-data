with Ada.Text_IO; use Ada.Text_IO;

procedure Insertion_Sort is
   type Int_Array is array (Positive range <>) of Integer;
   Data : Int_Array := (12, 11, 13, 5, 6);
   Key, J : Integer;
begin
   for I in Data'First + 1 .. Data'Last loop
      Key := Data (I);
      J := I - 1;
      while J >= Data'First and then Data (J) > Key loop
         Data (J + 1) := Data (J);
         J := J - 1;
      end loop;
      Data (J + 1) := Key;
   end loop;
   for Value of Data loop
      Put (Value'Image);
   end loop;
   New_Line;
end Insertion_Sort;
