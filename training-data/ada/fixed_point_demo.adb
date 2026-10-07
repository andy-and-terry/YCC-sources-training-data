with Ada.Text_IO; use Ada.Text_IO;

procedure Fixed_Point_Demo is
   type Money is delta 0.01 range -1_000_000.00 .. 1_000_000.00;
   type Percent is delta 0.1 digits 4;

   Price : constant Money := 19.99;
   Qty   : constant := 3;
   Total : Money;
   Rate  : constant Percent := 7.5;
begin
   Total := Price * Qty;
   Put_Line ("Total:" & Total'Image);
   Total := Total + Money (Float (Total) * Float (Rate) / 100.0);
   Put_Line ("With tax:" & Total'Image);
end Fixed_Point_Demo;
