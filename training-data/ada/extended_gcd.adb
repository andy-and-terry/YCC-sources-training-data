with Ada.Text_IO; use Ada.Text_IO;

procedure Extended_Gcd is
   procedure Compute (A, B : Integer; G, X, Y : out Integer) is
      X1, Y1, G1 : Integer;
   begin
      if B = 0 then
         G := A;
         X := 1;
         Y := 0;
      else
         Compute (B, A mod B, G1, X1, Y1);
         G := G1;
         X := Y1;
         Y := X1 - (A / B) * Y1;
      end if;
   end Compute;

   G, X, Y : Integer;
begin
   Compute (240, 46, G, X, Y);
   Put_Line ("gcd=" & G'Image);
   Put_Line ("x=" & X'Image);
   Put_Line ("y=" & Y'Image);
   Put_Line ("check=" & Integer'Image (240 * X + 46 * Y));
end Extended_Gcd;
