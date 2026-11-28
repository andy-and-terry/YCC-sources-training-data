with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure String_Fixed_Pad is
   S : constant String := "42";
begin
   Put_Line ("[" & Tail (S, 6, '0') & "]");
   Put_Line ("[" & Head (S, 6, '.') & "]");
end String_Fixed_Pad;
