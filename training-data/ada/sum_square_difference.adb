-- Square of the sum minus sum of squares for 1..10 (expect 2640)
with Ada.Text_IO; use Ada.Text_IO;

procedure SumSquareDifference is
   Sum, Squares : Integer := 0;
begin
   for I in 1 .. 10 loop
      Sum := Sum + I;
      Squares := Squares + I * I;
   end loop;
   Put_Line (Integer'Image (Sum * Sum - Squares));
end SumSquareDifference;
