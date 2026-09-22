with Ada.Text_IO; use Ada.Text_IO;

procedure Longest_Common_Subsequence is
   A : constant String := "ABCBDAB";
   B : constant String := "BDCABA";
   type DP_Table is array (0 .. A'Length, 0 .. B'Length) of Integer;
   DP : DP_Table := (others => (others => 0));
begin
   for I in 1 .. A'Length loop
      for J in 1 .. B'Length loop
         if A (I) = B (J) then
            DP (I, J) := DP (I - 1, J - 1) + 1;
         else
            DP (I, J) := Integer'Max (DP (I - 1, J), DP (I, J - 1));
         end if;
      end loop;
   end loop;
   Put_Line (DP (A'Length, B'Length)'Image);
end Longest_Common_Subsequence;
