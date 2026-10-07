with Ada.Text_IO; use Ada.Text_IO;

procedure Newton_Sqrt is
   type Real is digits 15;

   function Sqrt_Newton (X : Real) return Real is
      Guess : Real := X / 2.0;
   begin
      if X <= 0.0 then
         return 0.0;
      end if;
      for Iter in 1 .. 50 loop
         exit when abs (Guess * Guess - X) < 1.0E-12;
         Guess := (Guess + X / Guess) / 2.0;
      end loop;
      return Guess;
   end Sqrt_Newton;
begin
   Put_Line (Real'Image (Sqrt_Newton (2.0)));
   Put_Line (Real'Image (Sqrt_Newton (144.0)));
end Newton_Sqrt;
