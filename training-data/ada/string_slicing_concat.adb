with Ada.Text_IO; use Ada.Text_IO;
procedure String_Slice_Cat is
   S : constant String := "Hello, World";
begin
   Put_Line (S (1 .. 5));
   Put_Line (S (8 .. S'Last) & "!");
   Put_Line (Integer'Image (S'Length));
end String_Slice_Cat;
