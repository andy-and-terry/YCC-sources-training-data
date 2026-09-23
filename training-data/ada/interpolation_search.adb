with Ada.Text_IO; use Ada.Text_IO;

procedure Interpolation_Search is
   type Int_Array is array (Positive range <>) of Integer;

   -- Interpolation search: on a sorted, roughly-uniformly-distributed
   -- array, estimate the probable position of the target instead of
   -- always checking the midpoint as binary search does.
   function Search (A : Int_Array; Target : Integer) return Integer is
      Low, High, Pos : Integer;
   begin
      Low := A'First;
      High := A'Last;
      while Low <= High
        and then A (Low) <= Target
        and then Target <= A (High)
      loop
         if A (High) = A (Low) then
            if A (Low) = Target then
               return Low;
            else
               return -1;
            end if;
         end if;

         Pos := Low +
           ((Target - A (Low)) * (High - Low)) / (A (High) - A (Low));

         if A (Pos) = Target then
            return Pos;
         elsif A (Pos) < Target then
            Low := Pos + 1;
         else
            High := Pos - 1;
         end if;
      end loop;
      return -1;
   end Search;

   Data : constant Int_Array := (2, 4, 7, 10, 15, 22, 30, 45, 60, 90);
begin
   Put_Line ("Index of 22:" & Search (Data, 22)'Image);
   Put_Line ("Index of 90:" & Search (Data, 90)'Image);
   Put_Line ("Index of 5 (absent):" & Search (Data, 5)'Image);
end Interpolation_Search;
