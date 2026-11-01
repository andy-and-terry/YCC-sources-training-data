with Ada.Text_IO; use Ada.Text_IO;

--  Ways to write n as a sum of two or more consecutive positive integers.
procedure Polite_Numbers is
   function Polite_Ways (N : Positive) return Natural is
      K    : Positive := 2;
      Ways : Natural := 0;
   begin
      while K * (K + 1) / 2 <= N loop
         if (N - K * (K - 1) / 2) mod K = 0 then
            Ways := Ways + 1;
         end if;
         K := K + 1;
      end loop;
      return Ways;
   end Polite_Ways;
begin
   for N in 1 .. 16 loop
      Put (Integer'Image (Polite_Ways (N)));
   end loop;
   New_Line;
end Polite_Numbers;
