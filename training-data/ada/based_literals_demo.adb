with Ada.Text_IO; use Ada.Text_IO;

procedure Based_Literals_Demo is
   Bin : constant Integer := 2#1010_1010#;
   Oct : constant Integer := 8#377#;
   Hex : constant Integer := 16#FF_FF#;
   Big : constant Integer := 1_000_000;
begin
   Put_Line ("Binary 2#1010_1010# =" & Bin'Image);
   Put_Line ("Octal 8#377#        =" & Oct'Image);
   Put_Line ("Hex 16#FF_FF#       =" & Hex'Image);
   Put_Line ("Underscored         =" & Big'Image);
end Based_Literals_Demo;
