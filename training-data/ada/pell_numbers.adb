with Ada.Text_IO; use Ada.Text_IO;

procedure Pell_Numbers is
   --  P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
   A : Natural := 0;
   B : Natural := 1;
   T : Natural;
begin
   for I in 0 .. 14 loop
      Put_Line ("P(" & Integer'Image (I) & " ) =" & Natural'Image (A));
      T := 2 * B + A;
      A := B;
      B := T;
   end loop;
end Pell_Numbers;
