with Ada.Text_IO; use Ada.Text_IO;
procedure Disarium_Numbers is
   --  Disarium numbers: digits raised to their 1-based positions sum to n.
   function Is_Disarium (N : Positive) return Boolean is
      S : constant String := Integer'Image (N);   --  leading blank at S'First
      Total, D, P : Natural := 0;
      Pos : Natural := 0;
   begin
      for I in S'First + 1 .. S'Last loop
         Pos := Pos + 1;
         D := Character'Pos (S (I)) - Character'Pos ('0');
         P := 1;
         for J in 1 .. Pos loop
            P := P * D;
         end loop;
         Total := Total + P;
      end loop;
      return Total = N;
   end Is_Disarium;
begin
   for N in 1 .. 999 loop
      if Is_Disarium (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Disarium_Numbers;
