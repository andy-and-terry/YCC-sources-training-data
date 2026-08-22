with Ada.Text_IO; use Ada.Text_IO;

procedure Edit_Distance is
   A : constant String := "kitten";
   B : constant String := "sitting";
   type DP_Table is array (0 .. A'Length, 0 .. B'Length) of Integer;
   DP : DP_Table;
begin
   for I in 0 .. A'Length loop
      DP (I, 0) := I;
   end loop;
   for J in 0 .. B'Length loop
      DP (0, J) := J;
   end loop;
   for I in 1 .. A'Length loop
      for J in 1 .. B'Length loop
         if A (I) = B (J) then
            DP (I, J) := DP (I - 1, J - 1);
         else
            DP (I, J) := 1 + Integer'Min (Integer'Min (DP (I - 1, J - 1), DP (I - 1, J)), DP (I, J - 1));
         end if;
      end loop;
   end loop;
   Put_Line (DP (A'Length, B'Length)'Image);
end Edit_Distance;
