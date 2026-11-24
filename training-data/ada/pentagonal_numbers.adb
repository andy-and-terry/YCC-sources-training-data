with Ada.Text_IO; use Ada.Text_IO;
procedure Pentagonal_Numbers is
   --  Pentagonal numbers: n(3n-1)/2.
begin
   for N in 1 .. 10 loop
      Put (Integer'Image (N * (3 * N - 1) / 2));
   end loop;
   New_Line;
end Pentagonal_Numbers;
