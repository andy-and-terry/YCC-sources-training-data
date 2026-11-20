with Ada.Text_IO; use Ada.Text_IO;
--  Manhattan distance of two vectors.
procedure Manhattan_Distance is
   type Vec is array (1 .. 2) of Integer;
   A : constant Vec := (1, 2);
   B : constant Vec := (4, 6);
   S : Integer := 0;
begin
   for I in Vec'Range loop
      S := S + abs (A (I) - B (I));
   end loop;
   Put_Line (Integer'Image (S));
end Manhattan_Distance;
