with Ada.Text_IO; use Ada.Text_IO;

procedure Count_Vowels is
   function Count (S : String) return Natural is
      C : Natural := 0;
   begin
      for Ch of S loop
         case Ch is
            when 'a' | 'e' | 'i' | 'o' | 'u' => C := C + 1;
            when others => null;
         end case;
      end loop;
      return C;
   end Count;
begin
   Put_Line (Count ("hello world")'Image);
end Count_Vowels;
