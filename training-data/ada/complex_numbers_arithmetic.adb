with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Float_Text_IO;          use Ada.Float_Text_IO;
with Ada.Numerics.Complex_Types; use Ada.Numerics.Complex_Types;

procedure Complex_Numbers_Arithmetic is
   A : constant Complex := (Re => 3.0, Im => 4.0);
   B : constant Complex := (Re => 1.0, Im => -2.0);

   procedure Show (Label : String; Z : Complex) is
   begin
      Put (Label & " = ");
      Put (Re (Z), Fore => 1, Aft => 2, Exp => 0);
      Put (" + ");
      Put (Im (Z), Fore => 1, Aft => 2, Exp => 0);
      Put_Line ("i");
   end Show;
begin
   Show ("a", A);
   Show ("b", B);
   Show ("a + b", A + B);
   Show ("a - b", A - B);
   Show ("a * b", A * B);
   Show ("a / b", A / B);
   Show ("conjugate a", Conjugate (A));
   Show ("i * i", i * i);

   Put ("|a| = ");
   Put (Modulus (A), Fore => 1, Aft => 2, Exp => 0);
   New_Line;

   Put ("scaled a * 2.0: ");
   Put (Re (A * 2.0), Fore => 1, Aft => 1, Exp => 0);
   New_Line;
end Complex_Numbers_Arithmetic;
