--  Highest value reached by the Collatz (hailstone) sequence from N.
with Ada.Text_IO; use Ada.Text_IO;

procedure Hailstone_Peak is
   N    : Long_Long_Integer := 27;
   Best : Long_Long_Integer := N;
begin
   while N /= 1 loop
      if N mod 2 = 0 then
         N := N / 2;
      else
         N := 3 * N + 1;
      end if;
      Best := Long_Long_Integer'Max (Best, N);
   end loop;
   Put_Line (Long_Long_Integer'Image (Best));
end Hailstone_Peak;
