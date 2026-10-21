--  Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
with Ada.Text_IO; use Ada.Text_IO;

procedure Tribonacci_Numbers is
   A : Natural := 0;
   B : Natural := 0;
   C : Natural := 1;
   Nxt : Natural;
begin
   Put ("Tribonacci:");
   for I in 0 .. 14 loop
      Put (Natural'Image (A));
      Nxt := A + B + C;
      A := B;
      B := C;
      C := Nxt;
   end loop;
   New_Line;
end Tribonacci_Numbers;
