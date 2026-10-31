with Ada.Text_IO; use Ada.Text_IO;

procedure Multiplicative_Persistence is
   function Persistence (Value : Natural) return Natural is
      N       : Natural := Value;
      Steps   : Natural := 0;
      Product : Natural;
   begin
      while N >= 10 loop
         Product := 1;
         while N > 0 loop
            Product := Product * (N mod 10);
            N := N / 10;
         end loop;
         N := Product;
         Steps := Steps + 1;
      end loop;
      return Steps;
   end Persistence;
begin
   Put_Line ("39" & Natural'Image (Persistence (39)));
   Put_Line ("77" & Natural'Image (Persistence (77)));
   Put_Line ("999" & Natural'Image (Persistence (999)));
   Put_Line ("10" & Natural'Image (Persistence (10)));
end Multiplicative_Persistence;
