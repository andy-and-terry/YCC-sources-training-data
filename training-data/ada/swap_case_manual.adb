with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure Swap_Case_Manual is
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
   Put_Line (Swap_Case ("Hello World 42"));
end Swap_Case_Manual;
