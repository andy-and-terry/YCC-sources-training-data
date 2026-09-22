with Ada.Text_IO; use Ada.Text_IO;

procedure Rod_Cutting is
   type Int_Array is array (Natural range <>) of Integer;

   Price : constant Int_Array (1 .. 8) := (1, 5, 8, 9, 10, 17, 17, 20);
   N     : constant Natural := Price'Length;
   DP    : array (0 .. N) of Integer := (others => 0);
begin
   for Len in 1 .. N loop
      for Cut in 1 .. Len loop
         DP (Len) := Integer'Max (DP (Len), Price (Cut) + DP (Len - Cut));
      end loop;
   end loop;
   Put_Line (DP (N)'Image);
end Rod_Cutting;
