with Ada.Text_IO; use Ada.Text_IO;

procedure Kmp_Search is
   function Search (Text, Pattern : String) return Integer is
      N : constant Integer := Text'Length;
      M : constant Integer := Pattern'Length;
      type Lps_Array is array (0 .. M - 1) of Integer;
      Lps : Lps_Array := (others => 0);
      Len : Integer := 0;
      I, J : Integer;
   begin
      I := 1;
      while I < M loop
         if Pattern (Pattern'First + I) = Pattern (Pattern'First + Len) then
            Len := Len + 1;
            Lps (I) := Len;
            I := I + 1;
         elsif Len /= 0 then
            Len := Lps (Len - 1);
         else
            Lps (I) := 0;
            I := I + 1;
         end if;
      end loop;

      I := 0;
      J := 0;
      while I < N loop
         if Text (Text'First + I) = Pattern (Pattern'First + J) then
            I := I + 1;
            J := J + 1;
            if J = M then
               return I - J;
            end if;
         elsif J /= 0 then
            J := Lps (J - 1);
         else
            I := I + 1;
         end if;
      end loop;
      return -1;
   end Search;
begin
   Put_Line (Search ("abxabcabcaby", "abcaby")'Image);
   Put_Line (Search ("hello world", "world")'Image);
   Put_Line (Search ("hello world", "xyz")'Image);
end Kmp_Search;
