with Ada.Text_IO; use Ada.Text_IO;
--  Remove consecutive duplicate characters.
procedure Dedupe_Adjacent is
   S : constant String := "aabbbcdd";
   Last : Natural := 0;
   Out_Str : String (1 .. S'Length);
begin
   for I in S'Range loop
      if I = S'First or else S (I) /= S (I - 1) then
         Last := Last + 1;
         Out_Str (Last) := S (I);
      end if;
   end loop;
   Put_Line (Out_Str (1 .. Last));
end Dedupe_Adjacent;
