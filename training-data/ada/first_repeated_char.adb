with Ada.Text_IO; use Ada.Text_IO;

procedure First_Repeated_Char is
   function First_Repeated (S : String) return Character is
      Seen : array (Character) of Boolean := (others => False);
   begin
      for Ch of S loop
         if Seen (Ch) then
            return Ch;
         end if;
         Seen (Ch) := True;
      end loop;
      return ' ';
   end First_Repeated;
begin
   Put_Line (First_Repeated ("swiss") & "");
end First_Repeated_Char;
