with Ada.Text_IO; use Ada.Text_IO;

procedure Quantified_Expressions_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   A : constant Int_Array := (2, 4, 6, 8);
   B : constant Int_Array := (1, 4, 5);

   All_Even : constant Boolean := (for all X of A => X mod 2 = 0);
   Has_Odd  : constant Boolean := (for some X of B => X mod 2 = 1);
   Kind     : constant String  := (if All_Even then "even" else "mixed");
begin
   Put_Line ("A all even: " & All_Even'Image);
   Put_Line ("B has odd:  " & Has_Odd'Image);
   Put_Line ("Kind: " & Kind);
end Quantified_Expressions_Demo;
