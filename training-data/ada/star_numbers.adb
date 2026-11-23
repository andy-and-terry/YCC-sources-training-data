with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure StarNumbers is
   --  6n(n-1)+1
begin
   for N in 1 .. 15 loop
      Put (N, Width => 2);
      Put (" ->");
      Put (((6 * N) * (N - 1)) + 1, Width => 6);
      New_Line;
   end loop;
end StarNumbers;
