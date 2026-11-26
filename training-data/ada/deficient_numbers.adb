--  Deficient numbers below 100; expect 76.
with Ada.Text_IO; use Ada.Text_IO;

procedure Deficient_Numbers is
   function Proper_Sum (N : Integer) return Integer is
      T : Integer := 0;
   begin
      for D in 1 .. N - 1 loop
         if N mod D = 0 then
            T := T + D;
         end if;
      end loop;
      return T;
   end Proper_Sum;
   C : Integer := 0;
begin
   for N in 1 .. 99 loop
      if Proper_Sum (N) < N then
         C := C + 1;
      end if;
   end loop;
   Put_Line (Integer'Image (C));
end Deficient_Numbers;
