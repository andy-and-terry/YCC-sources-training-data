with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure PentagonalPyramidalNumbers is
   --  n^2(n+1)/2
begin
   for N in 1 .. 15 loop
      Put (N, Width => 2);
      Put (" ->");
      Put (((N * N) * (N + 1)) / 2, Width => 6);
      New_Line;
   end loop;
end PentagonalPyramidalNumbers;
