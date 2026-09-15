with Ada.Text_IO; use Ada.Text_IO;

procedure Longest_Common_Subsequence is
   function Lcs_Length (A, B : String) return Integer is
      M : constant Integer := A'Length;
      N : constant Integer := B'Length;
      type Dp_Array is array (0 .. M, 0 .. N) of Integer;
      Dp : Dp_Array := (others => (others => 0));
   begin
      for I in 1 .. M loop
         for J in 1 .. N loop
            if A (A'First + I - 1) = B (B'First + J - 1) then
               Dp (I, J) := Dp (I - 1, J - 1) + 1;
            elsif Dp (I - 1, J) >= Dp (I, J - 1) then
               Dp (I, J) := Dp (I - 1, J);
            else
               Dp (I, J) := Dp (I, J - 1);
            end if;
         end loop;
      end loop;
      return Dp (M, N);
   end Lcs_Length;
begin
   Put_Line (Lcs_Length ("abcde", "ace")'Image);
   Put_Line (Lcs_Length ("abc", "abc")'Image);
   Put_Line (Lcs_Length ("abc", "def")'Image);
end Longest_Common_Subsequence;
