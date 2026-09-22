with Ada.Text_IO; use Ada.Text_IO;

procedure Shell_Sort is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Sort (Data : in out Int_Array) is
      N    : constant Natural := Data'Length;
      Gap  : Natural := N / 2;
      Temp : Integer;
      J    : Integer;
   begin
      while Gap > 0 loop
         for I in Data'First + Gap .. Data'Last loop
            Temp := Data (I);
            J := I - Gap;
            while J >= Data'First and then Data (J) > Temp loop
               Data (J + Gap) := Data (J);
               J := J - Gap;
            end loop;
            Data (J + Gap) := Temp;
         end loop;
         Gap := Gap / 2;
      end loop;
   end Sort;

   Values : Int_Array := (9, 5, 1, 4, 8, 2, 7, 3, 6);
begin
   Sort (Values);
   for V of Values loop
      Put (V'Image);
   end loop;
   New_Line;
end Shell_Sort;
