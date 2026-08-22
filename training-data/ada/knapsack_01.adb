with Ada.Text_IO; use Ada.Text_IO;

procedure Knapsack_01 is
   type Int_Array is array (Positive range <>) of Integer;
   type DP_Table is array (0 .. 4, 0 .. 7) of Integer;

   Weights : constant Int_Array := (1, 3, 4, 5);
   Values : constant Int_Array := (1, 4, 5, 7);
   Capacity : constant Integer := 7;
   DP : DP_Table := (others => (others => 0));
begin
   for I in 1 .. 4 loop
      for W in 0 .. Capacity loop
         if Weights (I) <= W then
            DP (I, W) := Integer'Max (DP (I - 1, W), DP (I - 1, W - Weights (I)) + Values (I));
         else
            DP (I, W) := DP (I - 1, W);
         end if;
      end loop;
   end loop;
   Put_Line (DP (4, Capacity)'Image);
end Knapsack_01;
