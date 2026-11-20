with Ada.Text_IO; use Ada.Text_IO;
--  Shoelace polygon area with a record type.
procedure Shoelace_Polygon_Area is
   type Point is record X, Y : Float; end record;
   P : constant array (0 .. 3) of Point := ((0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0));
   S : Float := 0.0;
begin
   for I in P'Range loop
      declare
         Q : constant Point := P ((I + 1) mod 4);
      begin
         S := S + P (I).X * Q.Y - Q.X * P (I).Y;
      end;
   end loop;
   Put_Line (Float'Image (abs (S) / 2.0));
end Shoelace_Polygon_Area;
