with Ada.Text_IO; use Ada.Text_IO;

procedure Rabin_Karp_Search is
   Base    : constant Integer := 256;
   Modulus : constant Integer := 101;

   function Search (Text, Pattern : String) return Integer is
      N            : constant Integer := Text'Length;
      M            : constant Integer := Pattern'Length;
      Pattern_Hash : Integer := 0;
      Window_Hash  : Integer := 0;
      High_Order   : Integer := 1;
   begin
      if M > N then
         return -1;
      end if;

      for I in 1 .. M - 1 loop
         High_Order := (High_Order * Base) mod Modulus;
      end loop;

      for I in 0 .. M - 1 loop
         Pattern_Hash :=
           (Pattern_Hash * Base + Character'Pos (Pattern (Pattern'First + I))) mod Modulus;
         Window_Hash :=
           (Window_Hash * Base + Character'Pos (Text (Text'First + I))) mod Modulus;
      end loop;

      for I in 0 .. N - M loop
         if Pattern_Hash = Window_Hash
           and then Text (Text'First + I .. Text'First + I + M - 1) = Pattern
         then
            return I;
         end if;
         if I < N - M then
            Window_Hash :=
              ((Window_Hash - Character'Pos (Text (Text'First + I)) * High_Order) * Base
               + Character'Pos (Text (Text'First + I + M))) mod Modulus;
         end if;
      end loop;
      return -1;
   end Search;

begin
   Put_Line (Search ("abxabcabcaby", "abcaby")'Image);
   Put_Line (Search ("hello", "xyz")'Image);
end Rabin_Karp_Search;
