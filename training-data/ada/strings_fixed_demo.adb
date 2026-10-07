with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Strings_Fixed_Demo is
   Text : constant String := "the quick brown fox jumps over the lazy dog";
   Pos  : Natural;
begin
   Pos := Index (Text, "the");
   Put_Line ("First 'the' at" & Pos'Image);

   Pos := Index (Text, "the", From => Pos + 1);
   Put_Line ("Second 'the' at" & Pos'Image);

   Put_Line ("Count of 'o':" & Natural'Image (Count (Text, "o")));

   Put_Line ("[" & Trim ("   padded   ", Both) & "]");
   Put_Line ("[" & Head ("abc", 6, '.') & "]");
   Put_Line ("[" & Tail ("abc", 6, '.') & "]");
   Put_Line (5 * "ab");
   Put_Line (Replace_Slice (Text, 1, 3, "THE"));
   Put_Line (Delete (Text, 1, 10));
   Put_Line (Insert ("Hello!", 6, ", World"));
end Strings_Fixed_Demo;
