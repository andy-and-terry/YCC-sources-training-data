with Ada.Text_IO; use Ada.Text_IO;
procedure Shoelace_Area is
   type Vec is array (0 .. 3) of Float;
   X : constant Vec := (0.0, 4.0, 4.0, 0.0);
   Y : constant Vec := (0.0, 0.0, 3.0, 3.0);
   S : Float := 0.0;
   J : Integer;
begin
   for I in Vec'Range loop
      J := (I + 1) mod 4;
      S := S + X (I) * Y (J) - X (J) * Y (I);
   end loop;
   Put_Line (Float'Image (abs (S) / 2.0));
end Shoelace_Area;
