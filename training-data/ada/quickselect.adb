with Ada.Text_IO; use Ada.Text_IO;

procedure Quickselect is
   type Int_Array is array (Positive range <>) of Integer;

   procedure Swap (Arr : in out Int_Array; I, J : Integer) is
      Temp : Integer;
   begin
      Temp := Arr (I);
      Arr (I) := Arr (J);
      Arr (J) := Temp;
   end Swap;

   function Partition (Arr : in out Int_Array; Low, High : Integer) return Integer is
      Pivot : constant Integer := Arr (High);
      I : Integer := Low - 1;
   begin
      for J in Low .. High - 1 loop
         if Arr (J) <= Pivot then
            I := I + 1;
            Swap (Arr, I, J);
         end if;
      end loop;
      Swap (Arr, I + 1, High);
      return I + 1;
   end Partition;

   -- Finds the K'th smallest element (1-indexed) without fully sorting,
   -- by only recursing into the side of the partition that contains K.
   function Quick_Select (Arr : in out Int_Array; Low, High, K : Integer) return Integer is
      Pivot_Index : Integer;
   begin
      if Low = High then
         return Arr (Low);
      end if;
      Pivot_Index := Partition (Arr, Low, High);
      if K = Pivot_Index then
         return Arr (K);
      elsif K < Pivot_Index then
         return Quick_Select (Arr, Low, Pivot_Index - 1, K);
      else
         return Quick_Select (Arr, Pivot_Index + 1, High, K);
      end if;
   end Quick_Select;

   Data : Int_Array := (9, 3, 7, 1, 8, 2, 5);
   K    : constant Integer := Data'First + 2;
begin
   Put_Line ("3rd smallest: " & Quick_Select (Data, Data'First, Data'Last, K)'Image);
end Quickselect;
