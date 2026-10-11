with Ada.Text_IO; use Ada.Text_IO;

--  Delta aggregates require Ada 2022 (gnatmake -gnat2022)
procedure Delta_Aggregate_Demo is
   type Config is record
      Width, Height : Natural;
      Title         : String (1 .. 5);
      Visible       : Boolean;
   end record;

   Base : constant Config := (800, 600, "Hello", True);
   Small : constant Config := (Base with delta Width => 320, Height => 240);
begin
   Put_Line (Small.Width'Image & " x" & Small.Height'Image);
   Put_Line (Small.Title & " " & Boolean'Image (Small.Visible));
end Delta_Aggregate_Demo;
