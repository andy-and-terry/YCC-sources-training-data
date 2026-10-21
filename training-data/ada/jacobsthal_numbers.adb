--  Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
with Ada.Text_IO; use Ada.Text_IO;

procedure Jacobsthal_Numbers is
   A : Natural := 0;
   B : Natural := 1;
   T : Natural;
begin
   for I in 0 .. 14 loop
      Put (Natural'Image (A));
      T := B + 2 * A;
      A := B;
      B := T;
   end loop;
   New_Line;
end Jacobsthal_Numbers;
