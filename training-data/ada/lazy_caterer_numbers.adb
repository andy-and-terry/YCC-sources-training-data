with Ada.Text_IO; use Ada.Text_IO;
procedure Lazy_Caterer_Numbers is
   --  Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
begin
   for N in 0 .. 9 loop
      Put (Integer'Image (N * (N + 1) / 2 + 1));
   end loop;
   New_Line;
end Lazy_Caterer_Numbers;
