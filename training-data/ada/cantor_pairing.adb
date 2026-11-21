with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure Cantor_Pairing is
   --  Cantor pairing function and its inverse.
   function Pair (X, Y : Natural) return Natural is
   begin
      return (X + Y) * (X + Y + 1) / 2 + Y;
   end Pair;

   procedure Unpair (Z : Natural; X, Y : out Natural) is
      W : constant Natural := (Natural (Float'Floor (Sqrt (Float (8 * Z + 1)))) - 1) / 2;
   begin
      Y := Z - W * (W + 1) / 2;
      X := W - Y;
   end Unpair;

   A, B : Natural;
begin
   Put_Line (Natural'Image (Pair (3, 4)));
   Unpair (32, A, B);
   Put_Line (Natural'Image (A) & Natural'Image (B));
end Cantor_Pairing;
