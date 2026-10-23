with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;

procedure String_Fixed_Search_Demo is
   S : constant String := "the quick brown fox";
begin
   Put_Line (Ada.Strings.Fixed.Index (S, "quick")'Image);
   Put_Line (Ada.Strings.Fixed.Count (S, "o")'Image);
   Put_Line (Ada.Strings.Fixed.Replace_Slice (S, 5, 9, "slow"));
   Put_Line (Ada.Strings.Fixed.Trim ("   padded  ", Ada.Strings.Both) & "|");
   Put_Line (3 * "ab");
end String_Fixed_Search_Demo;
