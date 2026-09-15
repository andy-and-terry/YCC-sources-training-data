with Ada.Text_IO; use Ada.Text_IO;

procedure Kmp_Search is
   type Int_Array is array (Natural range <>) of Integer;

   function Build_Lps (Pattern : String) return Int_Array is
      M   : constant Natural := Pattern'Length;
      Lps : Int_Array (0 .. M - 1) := (others => 0);
      Len : Natural := 0;
      I   : Natural := 1;
   begin
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
      return Lps;
   end Build_Lps;

   function Kmp_Find (Text, Pattern : String) return Integer is
      N    : constant Natural := Text'Length;
      M    : constant Natural := Pattern'Length;
      Lps  : constant Int_Array := Build_Lps (Pattern);
      I, J : Natural := 0;
   begin
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
   end Kmp_Find;
begin
   Put_Line (Kmp_Find ("ababcababcabc", "abcabc")'Image);
   Put_Line (Kmp_Find ("hello world", "xyz")'Image);
end Kmp_Search;
