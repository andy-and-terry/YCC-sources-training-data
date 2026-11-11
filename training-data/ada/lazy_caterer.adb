-- Lazy caterer sequence: max pieces from n cuts
with Ada.Text_IO; use Ada.Text_IO;

procedure LazyCaterer is
   function F (N : Integer) return Integer is (((n * (n + 1))/2) + 1);
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (F (N)));
   end loop;
   New_Line;
end LazyCaterer;
