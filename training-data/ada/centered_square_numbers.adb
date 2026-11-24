with Ada.Text_IO; use Ada.Text_IO;
procedure Centered_Square_Numbers is
   --  Centered square numbers: n^2 + (n+1)^2.
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (N * N + (N + 1) * (N + 1)));
   end loop;
   New_Line;
end Centered_Square_Numbers;
