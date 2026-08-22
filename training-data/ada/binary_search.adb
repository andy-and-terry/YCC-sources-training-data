with Ada.Text_IO; use Ada.Text_IO;

procedure Binary_Search is
   type Int_Array is array (Positive range <>) of Integer;

   function Search (Arr : Int_Array; Target : Integer) return Integer is
      Low  : Integer := Arr'First;
      High : Integer := Arr'Last;
      Mid  : Integer;
   begin
      while Low <= High loop
         Mid := (Low + High) / 2;
         if Arr (Mid) = Target then
            return Mid;
         elsif Arr (Mid) < Target then
            Low := Mid + 1;
         else
            High := Mid - 1;
         end if;
      end loop;
      return -1;
   end Search;

   Sorted : constant Int_Array := (1, 3, 5, 7, 9, 11, 13);
begin
   Put_Line (Search (Sorted, 7)'Image);
   Put_Line (Search (Sorted, 4)'Image);
end Binary_Search;
