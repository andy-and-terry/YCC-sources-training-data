with Ada.Text_IO; use Ada.Text_IO;

procedure Palindrome is
   function Is_Palindrome (S : String) return Boolean is
   begin
      for I in S'Range loop
         if S (I) /= S (S'Last - (I - S'First)) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Palindrome;
begin
   Put_Line (Is_Palindrome ("racecar")'Image);
   Put_Line (Is_Palindrome ("hello")'Image);
end Palindrome;
