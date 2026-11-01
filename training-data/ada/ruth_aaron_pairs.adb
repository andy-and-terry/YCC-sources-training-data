with Ada.Text_IO; use Ada.Text_IO;

--  Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
procedure Ruth_Aaron_Pairs is
   function Sopfr (Start : Positive) return Natural is
      N     : Positive := Start;
      P     : Positive := 2;
      Total : Natural := 0;
   begin
      while P * P <= N loop
         while N mod P = 0 loop
            Total := Total + P;
            N := N / P;
         end loop;
         P := P + 1;
      end loop;
      if N > 1 then
         Total := Total + N;
      end if;
      return Total;
   end Sopfr;
begin
   for N in 2 .. 109 loop
      if Sopfr (N) = Sopfr (N + 1) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Ruth_Aaron_Pairs;
