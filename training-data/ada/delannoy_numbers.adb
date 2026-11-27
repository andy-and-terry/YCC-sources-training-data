with Ada.Text_IO; use Ada.Text_IO;

procedure Delannoy_Numbers is
   N : constant := 7;
   D : array (0 .. N, 0 .. N) of Long_Integer := (others => (others => 1));
begin
   for I in 1 .. N loop
      for J in 1 .. N loop
         D (I, J) := D (I - 1, J) + D (I, J - 1) + D (I - 1, J - 1);
      end loop;
   end loop;
   for I in 0 .. N loop
      Put (Long_Integer'Image (D (I, I)));
   end loop;
   New_Line;
end Delannoy_Numbers;
