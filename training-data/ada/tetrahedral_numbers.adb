with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure TetrahedralNumbers is
   --  n(n+1)(n+2)/6
begin
   for N in 1 .. 15 loop
      Put (N, Width => 2);
      Put (" ->");
      Put (((N * (N + 1)) * (N + 2)) / 6, Width => 6);
      New_Line;
   end loop;
end TetrahedralNumbers;
