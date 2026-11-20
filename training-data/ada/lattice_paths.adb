with Ada.Text_IO; use Ada.Text_IO;
--  Lattice paths with a DP row.
procedure Lattice_Paths is
   N : constant := 3;
   Row : array (0 .. N) of Natural := (others => 1);
begin
   for K in 1 .. N loop
      for J in 1 .. N loop
         Row (J) := Row (J) + Row (J - 1);
      end loop;
   end loop;
   Put_Line (Natural'Image (Row (N)));
end Lattice_Paths;
