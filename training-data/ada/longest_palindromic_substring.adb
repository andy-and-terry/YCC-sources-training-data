with Ada.Text_IO; use Ada.Text_IO;

procedure Longest_Palindromic_Substring is
   function Expand (S : String; L, R : Integer) return Natural is
      Left  : Integer := L;
      Right : Integer := R;
   begin
      while Left >= S'First and then Right <= S'Last
        and then S (Left) = S (Right)
      loop
         Left := Left - 1;
         Right := Right + 1;
      end loop;
      return Right - Left - 1;
   end Expand;

   function Longest_Palindrome (S : String) return String is
      Best_Start : Integer := S'First;
      Best_Len   : Natural := 0;
   begin
      for I in S'Range loop
         declare
            Odd  : constant Natural := Expand (S, I, I);
            Even : constant Natural := Expand (S, I, I + 1);
            Len  : Natural := Natural'Max (Odd, Even);
         begin
            if Len > Best_Len then
               Best_Len := Len;
               Best_Start := I - (Len - 1) / 2;
            end if;
         end;
      end loop;
      return S (Best_Start .. Best_Start + Best_Len - 1);
   end Longest_Palindrome;
begin
   Put_Line (Longest_Palindrome ("babad"));
   Put_Line (Longest_Palindrome ("cbbd"));
end Longest_Palindromic_Substring;
