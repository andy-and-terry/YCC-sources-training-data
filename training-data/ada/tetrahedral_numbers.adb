-- Tetrahedral numbers n(n+1)(n+2)/6
with Ada.Text_IO; use Ada.Text_IO;

procedure TetrahedralNumbers is
   function F (N : Integer) return Integer is (((n * (n + 1)) * (n + 2))/6);
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (F (N)));
   end loop;
   New_Line;
end TetrahedralNumbers;
