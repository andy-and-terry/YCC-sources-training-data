with Ada.Text_IO; use Ada.Text_IO;

procedure Alternating_Digit_Sum is
   function ADS (Value : Natural) return Integer is
      N     : Natural := Value;
      Total : Integer := 0;
      Sign  : Integer := 1;
   begin
      while N > 0 loop
         Total := Total + Sign * (N mod 10);
         Sign := -Sign;
         N := N / 10;
      end loop;
      return Total;
   end ADS;
begin
   Put_Line ("1234" & Integer'Image (ADS (1234)));
   Put_Line ("99999" & Integer'Image (ADS (99999)));
   Put_Line ("1000" & Integer'Image (ADS (1000)));
end Alternating_Digit_Sum;
