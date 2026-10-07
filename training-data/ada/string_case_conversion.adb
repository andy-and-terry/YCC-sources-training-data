with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure String_Case_Conversion is
   Text : constant String := "Hello, Ada World 2024!";

   function Swap_Case (S : String) return String is
      R : String := S;
   begin
      for I in R'Range loop
         if Is_Upper (R (I)) then
            R (I) := To_Lower (R (I));
         elsif Is_Lower (R (I)) then
            R (I) := To_Upper (R (I));
         end if;
      end loop;
      return R;
   end Swap_Case;
begin
   Put_Line ("Original: " & Text);
   Put_Line ("Upper:    " & To_Upper (Text));
   Put_Line ("Lower:    " & To_Lower (Text));
   Put_Line ("Swapped:  " & Swap_Case (Text));
end String_Case_Conversion;
