with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

procedure String_Index_Count is
   S : constant String := "the quick brown fox jumps over the lazy dog";
begin
   Put_Line ("First 'the' at" & Index (S, "the")'Image);
   Put_Line ("Last 'the' at" & Index (S, "the", Going => Backward)'Image);
   Put_Line ("Count of 'o':" & Count (S, "o")'Image);
   Put_Line ("Not found:" & Index (S, "cat")'Image);
   Put_Line (Trim ("   padded   ", Both) & "|");
end String_Index_Count;
