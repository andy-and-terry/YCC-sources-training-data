with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure Anagram_Check is
   function Is_Anagram (A, B : String) return Boolean is
      Counts : array (Character range 'a' .. 'z') of Integer := (others => 0);
      C      : Character;
   begin
      if A'Length /= B'Length then
         return False;
      end if;
      for Ch of A loop
         C := To_Lower (Ch);
         if C in 'a' .. 'z' then
            Counts (C) := Counts (C) + 1;
         end if;
      end loop;
      for Ch of B loop
         C := To_Lower (Ch);
         if C in 'a' .. 'z' then
            Counts (C) := Counts (C) - 1;
         end if;
      end loop;
      for Count of Counts loop
         if Count /= 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Anagram;
begin
   Put_Line (Is_Anagram ("listen", "silent")'Image);
   Put_Line (Is_Anagram ("hello", "world")'Image);
end Anagram_Check;
