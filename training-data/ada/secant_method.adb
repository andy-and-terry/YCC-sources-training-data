with Ada.Text_IO; use Ada.Text_IO;
procedure Secant_Method is
   function F (X : Float) return Float is (X * X - 2.0);
   A : Float := 1.0;
   B : Float := 2.0;
   C : Float;
begin
   for I in 1 .. 40 loop
      exit when F (B) = F (A);
      C := B - F (B) * (B - A) / (F (B) - F (A));
      A := B;
      B := C;
   end loop;
   Put_Line (Float'Image (B));
end Secant_Method;
