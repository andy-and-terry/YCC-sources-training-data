with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure OctahedralNumbers is
   --  n(2n^2+1)/3
begin
   for N in 1 .. 15 loop
      Put (N, Width => 2);
      Put (" ->");
      Put ((N * (((2 * N) * N) + 1)) / 3, Width => 6);
      New_Line;
   end loop;
end OctahedralNumbers;
