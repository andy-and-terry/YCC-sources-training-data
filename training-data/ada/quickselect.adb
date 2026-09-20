with Ada.Text_IO; use Ada.Text_IO;

procedure Quickselect is
   type Int_Array is array (Positive range <>) of Integer;

   function Partition (Arr : in out Int_Array; Low, High : Integer) return Integer is
      Pivot : constant Integer := Arr (High);
      I     : Integer := Low - 1;
      Temp  : Integer;
   begin
      for J in Low .. High - 1 loop
         if Arr (J) <= Pivot then
            I := I + 1;
            Temp := Arr (I);
            Arr (I) := Arr (J);
            Arr (J) := Temp;
         end if;
      end loop;
      Temp := Arr (I + 1);
      Arr (I + 1) := Arr (High);
      Arr (High) := Temp;
      return I + 1;
   end Partition;

   function Select_Kth (Arr : in out Int_Array; Low, High, K : Integer) return Integer is
      Pivot_Index : Integer;
   begin
      if Low = High then
         return Arr (Low);
      end if;
      Pivot_Index := Partition (Arr, Low, High);
      if K = Pivot_Index then
         return Arr (K);
      elsif K < Pivot_Index then
         return Select_Kth (Arr, Low, Pivot_Index - 1, K);
      else
         return Select_Kth (Arr, Pivot_Index + 1, High, K);
      end if;
   end Select_Kth;

   Data : Int_Array := (7, 10, 4, 3, 20, 15);
begin
   -- 3rd smallest element (1-based rank)
   Put_Line (Select_Kth (Data, Data'First, Data'Last, 3)'Image);
end Quickselect;
