with Ada.Text_IO; use Ada.Text_IO;

procedure Find_Missing_Number is
   type Int_Array is array (Positive range <>) of Integer;

   function Find_Missing (Arr : Int_Array; N : Integer) return Integer is
      Expected_Sum, Actual_Sum : Integer;
   begin
      Expected_Sum := N * (N + 1) / 2;
      Actual_Sum := 0;
      for V of Arr loop
         Actual_Sum := Actual_Sum + V;
      end loop;
      return Expected_Sum - Actual_Sum;
   end Find_Missing;

   Data : constant Int_Array := (1, 2, 4, 5, 6);
begin
   Put_Line (Find_Missing (Data, 6)'Image);
end Find_Missing_Number;
