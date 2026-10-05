with Ada.Text_IO; use Ada.Text_IO;

procedure Caesar_Cipher is
   function Shift (Text : String; Key : Integer) return String is
      Result : String := Text;
      K : constant Integer := ((Key mod 26) + 26) mod 26;
   begin
      for I in Result'Range loop
         case Result (I) is
            when 'A' .. 'Z' =>
               Result (I) := Character'Val
                 ((Character'Pos (Result (I)) - Character'Pos ('A') + K) mod 26
                  + Character'Pos ('A'));
            when 'a' .. 'z' =>
               Result (I) := Character'Val
                 ((Character'Pos (Result (I)) - Character'Pos ('a') + K) mod 26
                  + Character'Pos ('a'));
            when others =>
               null;
         end case;
      end loop;
      return Result;
   end Shift;

   Encrypted : constant String := Shift ("Hello, World!", 3);
begin
   Put_Line (Encrypted);
   Put_Line (Shift (Encrypted, -3));
end Caesar_Cipher;
