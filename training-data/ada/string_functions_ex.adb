with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure String_Functions_Ex is
   S : constant String := "  Hello Ada  ";
begin
   Put_Line ("[" & Trim (S, Ada.Strings.Both) & "]");
   Put_Line (To_Upper (S));
   Put_Line (Natural'Image (Index (S, "Ada")));
   Put_Line (5 * "ab");
end String_Functions_Ex;
