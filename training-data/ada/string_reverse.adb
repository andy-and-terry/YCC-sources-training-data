with Ada.Text_IO; use Ada.Text_IO;

procedure String_Reverse is
   function Reverse_String (S : String) return String is
      Result : String (S'Range);
   begin
      for I in S'Range loop
         Result (S'Last - I + S'First) := S (I);
      end loop;
      return Result;
   end Reverse_String;
begin
   Put_Line (Reverse_String ("hello world"));
end String_Reverse;
