with Ada.Text_IO; use Ada.Text_IO;

procedure Enumeration_IO_Demo is
   type Color is (Red, Green, Blue);
   package Color_IO is new Ada.Text_IO.Enumeration_IO (Color);
begin
   Color_IO.Put (Green);
   New_Line;
   Color_IO.Put (Blue, Width => 8);
   Put_Line ("|");
   Color_IO.Default_Setting := Ada.Text_IO.Lower_Case;
   Color_IO.Put (Red);
   New_Line;
end Enumeration_IO_Demo;
