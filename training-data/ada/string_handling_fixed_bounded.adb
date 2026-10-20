with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure String_Handling_Fixed_Bounded is
   S : constant String := "Hello, World";
begin
   Put_Line (To_Upper (S) & " " & To_Lower (S));
   Put_Line (Natural'Image (Index (S, "World")) & Natural'Image (Count (S, "l")));
   Put_Line (Head (S, 5) & "|" & Tail (S, 5) & "|" & Trim ("  pad  ", Both) & "|");
   Put_Line (Replace_Slice (S, 1, 5, "Howdy"));
   Put_Line (5 * "ab");
   Put_Line (Natural'Image (S'Length) & S (S'First) & S (S'Last));
   Put_Line (Integer'Image (Integer'Value ("  42")) & Float'Image (Float'Value ("2.5")));
   Put_Line (Translate (S, Ada.Strings.Maps.To_Mapping ("lo", "01")));
end String_Handling_Fixed_Bounded;
