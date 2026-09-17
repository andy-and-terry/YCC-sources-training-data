with Ada.Text_IO; use Ada.Text_IO;

procedure Longest_Increasing_Subsequence is
   type Int_Array is array (Positive range <>) of Integer;

   function Lis_Length (Data : Int_Array) return Natural is
      N       : constant Natural := Data'Length;
      Lengths : array (Data'Range) of Natural := (others => 1);
      Best    : Natural := 0;
   begin
      for I in Data'First + 1 .. Data'Last loop
         for J in Data'First .. I - 1 loop
            if Data (J) < Data (I) and then Lengths (J) + 1 > Lengths (I) then
               Lengths (I) := Lengths (J) + 1;
            end if;
         end loop;
      end loop;
      for L of Lengths loop
         if L > Best then
            Best := L;
         end if;
      end loop;
      return Best;
   end Lis_Length;

   Values : constant Int_Array := (10, 9, 2, 5, 3, 7, 101, 18);
begin
   Put_Line (Lis_Length (Values)'Image);
end Longest_Increasing_Subsequence;
