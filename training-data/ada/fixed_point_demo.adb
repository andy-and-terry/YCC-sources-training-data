with Ada.Text_IO; use Ada.Text_IO;

procedure Fixed_Point_Demo is
   type Money is delta 0.01 digits 12;
   package Money_IO is new Ada.Text_IO.Decimal_IO (Money);

   Price : constant Money := 19.99;
   Tax_Rate : constant := 0.08;
   Total : Money;
begin
   Total := Price * 3;
   Total := Total + Money (Total * Tax_Rate);
   Put ("Total: ");
   Money_IO.Put (Total, Fore => 1, Aft => 2, Exp => 0);
   New_Line;
end Fixed_Point_Demo;
