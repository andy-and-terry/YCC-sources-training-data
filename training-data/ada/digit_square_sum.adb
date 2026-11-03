with Ada.Text_IO; use Ada.Text_IO;

procedure Digit_Square_Sum is
   function Compute (N : Integer) return Natural is
      M   : Natural := abs N;
      Sum : Natural := 0;
   begin
      while M > 0 loop
         Sum := Sum + (M mod 10) ** 2;
         M := M / 10;
      end loop;
      return Sum;
   end Compute;
begin
   Put_Line (Natural'Image (Compute (123)));
   Put_Line (Natural'Image (Compute (-99)));
end Digit_Square_Sum;
