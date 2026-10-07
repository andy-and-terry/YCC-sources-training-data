with Ada.Text_IO; use Ada.Text_IO;

procedure Renames_Demo is
   type Point is record
      X, Y : Integer;
   end record;

   type Shape is record
      Corner : Point;
      Label  : String (1 .. 4);
   end record;

   S : Shape := (Corner => (X => 3, Y => 4), Label => "box1");

   --  Rename a deeply nested component
   Px : Integer renames S.Corner.X;

   --  Rename a subprogram under a shorter name
   procedure Say (Text : String) renames Put_Line;
begin
   Px := Px + 10;
   Say ("Corner X now" & S.Corner.X'Image);
end Renames_Demo;
