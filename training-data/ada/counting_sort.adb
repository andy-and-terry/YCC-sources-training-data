with Ada.Text_IO; use Ada.Text_IO;

procedure Counting_Sort is
   type Int_Array is array (Positive range <>) of Integer;

   Max_Value : constant := 20;

   function Sorted (Data : Int_Array) return Int_Array is
      Counts : array (0 .. Max_Value) of Natural := (others => 0);
      Result : Int_Array (Data'Range);
      Pos    : Positive := Result'First;
   begin
      for V of Data loop
         Counts (V) := Counts (V) + 1;
      end loop;
      for Value in Counts'Range loop
         for Occurrence in 1 .. Counts (Value) loop
            Result (Pos) := Value;
            Pos := Pos + 1;
         end loop;
      end loop;
      return Result;
   end Sorted;

   Values : constant Int_Array := (5, 2, 9, 1, 5, 6, 0, 3, 12, 2);
begin
   for V of Sorted (Values) loop
      Put (V'Image);
   end loop;
   New_Line;
end Counting_Sort;
