with Ada.Text_IO; use Ada.Text_IO;

procedure Chebyshev_Distance is
   type Vec is array (Positive range <>) of Integer;
   A : constant Vec := (1, 2);
   B : constant Vec := (4, 6);
   Best : Natural := 0;
begin
   for I in A'Range loop
      Best := Natural'Max (Best, abs (A (I) - B (I)));
   end loop;
   Put_Line (Natural'Image (Best));
end Chebyshev_Distance;
