with Ada.Text_IO; use Ada.Text_IO;

procedure Fixed_Point_Demo is
   type Money is delta 0.01 range -1_000_000.00 .. 1_000_000.00;
   Price : Money := 19.99;
   Total : Money;
begin
   Total := Price * 3;
   Put_Line ("Total:" & Money'Image (Total));
   Total := Total / 2;
   Put_Line ("Half :" & Money'Image (Total));
end Fixed_Point_Demo;
