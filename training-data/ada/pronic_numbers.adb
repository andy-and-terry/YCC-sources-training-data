-- Pronic numbers n(n+1)
with Ada.Text_IO; use Ada.Text_IO;

procedure PronicNumbers is
   function F (N : Integer) return Integer is (n * (n + 1));
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (F (N)));
   end loop;
   New_Line;
end PronicNumbers;
