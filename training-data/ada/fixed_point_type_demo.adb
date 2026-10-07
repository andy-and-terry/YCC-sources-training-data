with Ada.Text_IO; use Ada.Text_IO;

procedure Fixed_Point_Type_Demo is
   type Money is delta 0.01 digits 12;
   type Ratio is delta 2.0 ** (-8) range -1.0 .. 1.0;

   Price    : constant Money := 19.99;
   Quantity : constant := 3;
   Total    : Money;
   Tax      : Money;
   R        : Ratio := 0.5;

   package Money_IO is new Ada.Text_IO.Fixed_IO (Money);
   package Ratio_IO is new Ada.Text_IO.Fixed_IO (Ratio);
begin
   Total := Price * Quantity;
   Tax   := Total * 0.08;

   Put ("Total: "); Money_IO.Put (Total, Fore => 4, Aft => 2, Exp => 0); New_Line;
   Put ("Tax  : "); Money_IO.Put (Tax,   Fore => 4, Aft => 2, Exp => 0); New_Line;

   R := R / 2;
   Put ("Ratio: "); Ratio_IO.Put (R, Fore => 1, Aft => 4, Exp => 0); New_Line;
   Put_Line ("Small =" & Money'Image (Money'Small));
end Fixed_Point_Type_Demo;
