with Ada.Text_IO; use Ada.Text_IO;

procedure Shoelace_Polygon_Area is
   type Pt is record X, Y : Integer; end record;
   P : constant array (1 .. 4) of Pt := ((0, 0), (4, 0), (4, 3), (0, 3));
   S : Integer := 0;
begin
   for I in P'Range loop
      declare
         J : constant Integer := (if I = P'Last then P'First else I + 1);
      begin
         S := S + P (I).X * P (J).Y - P (J).X * P (I).Y;
      end;
   end loop;
   Put_Line ("Area:" & Integer'Image (abs S / 2));
end Shoelace_Polygon_Area;
