-- Centered square numbers 2n(n+1)+1
with Ada.Text_IO; use Ada.Text_IO;

procedure CenteredSquareNumbers is
   function F (N : Integer) return Integer is (((2 * n) * (n + 1)) + 1);
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (F (N)));
   end loop;
   New_Line;
end CenteredSquareNumbers;
