with Ada.Text_IO; use Ada.Text_IO;

procedure Coin_Change is
   type Coin_Array is array (Positive range <>) of Integer;
   type DP_Array is array (0 .. 11) of Integer;

   Coins : constant Coin_Array := (1, 2, 5);
   Amount : constant Integer := 11;
   DP : DP_Array := (others => Amount + 1);
begin
   DP (0) := 0;
   for A in 1 .. Amount loop
      for C of Coins loop
         if C <= A and then DP (A - C) + 1 < DP (A) then
            DP (A) := DP (A - C) + 1;
         end if;
      end loop;
   end loop;
   if DP (Amount) > Amount then
      Put_Line ("-1");
   else
      Put_Line (DP (Amount)'Image);
   end if;
end Coin_Change;
