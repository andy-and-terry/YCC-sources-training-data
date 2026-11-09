with Ada.Text_IO; use Ada.Text_IO;
procedure String_Split_Words is
   S     : constant String := "the quick brown fox";
   Start : Positive := S'First;
begin
   for I in S'Range loop
      if S (I) = ' ' then
         Put_Line (S (Start .. I - 1));
         Start := I + 1;
      end if;
   end loop;
   Put_Line (S (Start .. S'Last));
end String_Split_Words;
