with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Secant_Method is
   function F (X : Long_Float) return Long_Float is (X * X - 2.0);
   X0 : Long_Float := 1.0;
   X1 : Long_Float := 2.0;
   Nx : Long_Float;
begin
   for I in 1 .. 50 loop
      exit when F (X1) = F (X0);
      Nx := X1 - F (X1) * (X1 - X0) / (F (X1) - F (X0));
      X0 := X1;
      X1 := Nx;
      exit when abs (X1 - X0) < 1.0E-12;
   end loop;
   Put_Line (Long_Float'Image (X1));
end Secant_Method;
