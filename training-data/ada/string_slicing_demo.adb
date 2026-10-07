with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Strings.Maps.Constants;

procedure String_Slicing_Demo is
   S : constant String := "Hello, Ada World";
begin
   Put_Line (S (1 .. 5));
   Put_Line (S (S'Last - 4 .. S'Last));
   Put_Line (Ada.Strings.Fixed.Index (S, "Ada")'Image);
   Put_Line (Ada.Strings.Fixed."*" (3, "ab"));
   Put_Line (Ada.Strings.Fixed.Translate (S, Ada.Strings.Maps.Constants.Upper_Case_Map));
end String_Slicing_Demo;
