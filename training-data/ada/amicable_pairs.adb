with Ada.Text_IO; use Ada.Text_IO;
procedure Amicable_Pairs is
   --  Amicable pairs below 1500 via sums of proper divisors.
   function S (N : Positive) return Natural is
      T : Natural := 0;
   begin
      for D in 1 .. N - 1 loop
         if N mod D = 0 then
            T := T + D;
         end if;
      end loop;
      return T;
   end S;
   B : Natural;
begin
   for A in 2 .. 1499 loop
      B := S (A);
      if B > A and then B < 1500 and then S (B) = A then
         Put_Line (Integer'Image (A) & Integer'Image (B));
      end if;
   end loop;
end Amicable_Pairs;
