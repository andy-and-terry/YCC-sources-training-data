with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings;

procedure String_Fixed_Trim_Ex is
   S : constant String := "   padded   ";
begin
   Put_Line ("[" & Trim (S, Ada.Strings.Both) & "]");
   Put_Line (Natural'Image (Index ("hello world", "wor")));
end String_Fixed_Trim_Ex;
