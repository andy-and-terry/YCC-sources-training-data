with Ada.Text_IO; use Ada.Text_IO;

procedure Rabin_Karp is
   Base    : constant := 256;
   Modulus : constant := 101;

   function Search (Text, Pattern : String) return Integer is
      N       : constant Natural := Text'Length;
      M       : constant Natural := Pattern'Length;
      Pat_Hash  : Natural := 0;
      Txt_Hash  : Natural := 0;
      High_Order : Natural := 1;
   begin
      if M = 0 or else M > N then
         return -1;
      end if;

      for I in 1 .. M - 1 loop
         High_Order := (High_Order * Base) mod Modulus;
      end loop;

      for I in 0 .. M - 1 loop
         Pat_Hash := (Base * Pat_Hash + Character'Pos (Pattern (Pattern'First + I))) mod Modulus;
         Txt_Hash := (Base * Txt_Hash + Character'Pos (Text (Text'First + I))) mod Modulus;
      end loop;

      for I in 0 .. N - M loop
         if Pat_Hash = Txt_Hash then
            if Text (Text'First + I .. Text'First + I + M - 1) = Pattern then
               return I;
            end if;
         end if;
         if I < N - M then
            Txt_Hash := (Base * (Txt_Hash - Character'Pos (Text (Text'First + I)) * High_Order)
                          + Character'Pos (Text (Text'First + I + M))) mod Modulus;
            if Txt_Hash < 0 then
               Txt_Hash := Txt_Hash + Modulus;
            end if;
         end if;
      end loop;
      return -1;
   end Search;
begin
   Put_Line (Integer'Image (Search ("abxabcabcaby", "abcaby")));
   Put_Line (Integer'Image (Search ("hello world", "xyz")));
end Rabin_Karp;
