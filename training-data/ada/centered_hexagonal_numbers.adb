with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure CenteredHexagonalNumbers is
   --  3n(n-1)+1
begin
   for N in 1 .. 15 loop
      Put (N, Width => 2);
      Put (" ->");
      Put (((3 * N) * (N - 1)) + 1, Width => 6);
      New_Line;
   end loop;
end CenteredHexagonalNumbers;
