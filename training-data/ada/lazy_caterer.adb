with Ada.Text_IO; use Ada.Text_IO;

procedure Lazy_Caterer is
   function Pieces (Cuts : Natural) return Natural is ((Cuts * Cuts + Cuts + 2) / 2);
begin
   for N in 0 .. 9 loop
      Put (Natural'Image (Pieces (N)));
   end loop;
   New_Line;  --  1 2 4 7 11 16 22 29 37 46
end Lazy_Caterer;
