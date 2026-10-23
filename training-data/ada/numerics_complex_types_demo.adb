with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Numerics.Complex_Types;     use Ada.Numerics.Complex_Types;
with Ada.Numerics.Complex_Elementary_Functions;
use Ada.Numerics.Complex_Elementary_Functions;

procedure Numerics_Complex_Types_Demo is
   A : constant Complex := (Re => 3.0, Im => 4.0);
   B : constant Complex := Compose_From_Cartesian (1.0, -2.0);
   C : Complex;

   procedure Show (Label : String; Z : Complex) is
   begin
      Put_Line (Label & ": " & Float'Image (Re (Z)) & " +" & Float'Image (Im (Z)) & "i");
   end Show;
begin
   Show ("A    ", A);
   Show ("B    ", B);

   C := A + B;
   Show ("A + B", C);

   C := A * B;
   Show ("A * B", C);

   C := A / B;
   Show ("A / B", C);

   Show ("conj ", Conjugate (A));
   Put_Line ("|A| = " & Float'Image (Modulus (A)));
   Put_Line ("sqrt(-1) = " & Float'Image (Im (Sqrt (Compose_From_Cartesian (-1.0)))));
end Numerics_Complex_Types_Demo;
