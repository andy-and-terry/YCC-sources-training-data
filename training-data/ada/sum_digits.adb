with Ada.Text_IO; use Ada.Text_IO;

procedure Sum_Digits is
   function Digit_Sum (N : Natural) return Natural is
      M : Natural := N;
      Sum : Natural := 0;
   begin
      while M > 0 loop
         Sum := Sum + M mod 10;
         M := M / 10;
      end loop;
      return Sum;
   end Digit_Sum;
begin
   Put_Line (Digit_Sum (12345)'Image);
end Sum_Digits;
