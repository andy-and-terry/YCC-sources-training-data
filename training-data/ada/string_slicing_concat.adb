with Ada.Text_IO; use Ada.Text_IO;

procedure Slice_Demo is
   S : constant String := "Hello, Ada";
begin
   Put_Line (S (1 .. 5));
   Put_Line (S (8 .. S'Last) & "!");
   Put_Line (Integer'Image (S'Length));
end Slice_Demo;
