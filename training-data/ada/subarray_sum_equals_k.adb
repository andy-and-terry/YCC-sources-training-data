--  Count contiguous subarrays whose sum equals K (O(n^2) running sums).
with Ada.Text_IO; use Ada.Text_IO;

procedure Subarray_Sum_Equals_K is
   Nums  : constant array (1 .. 3) of Integer := (1, 1, 1);
   K     : constant Integer := 2;
   Count : Natural := 0;
   Sum   : Integer;
begin
   for I in Nums'Range loop
      Sum := 0;
      for J in I .. Nums'Last loop
         Sum := Sum + Nums (J);
         if Sum = K then
            Count := Count + 1;
         end if;
      end loop;
   end loop;
   Put_Line (Natural'Image (Count));
end Subarray_Sum_Equals_K;
