with Ada.Text_IO; use Ada.Text_IO;
procedure Hexagonal_Numbers is
   --  Hexagonal numbers: n(2n-1).
begin
   for N in 1 .. 10 loop
      Put (Integer'Image (N * (2 * N - 1)));
   end loop;
   New_Line;
end Hexagonal_Numbers;
