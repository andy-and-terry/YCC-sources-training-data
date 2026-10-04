with Ada.Text_IO; use Ada.Text_IO;
with Ada.Assertions;

procedure Assertion_Demo is
   function Divide (A, B : Integer) return Integer
     with Pre => B /= 0
   is
   begin
      return A / B;
   end Divide;
begin
   pragma Assert (Divide (10, 2) = 5);
   Put_Line ("10 / 2 = " & Divide (10, 2)'Image);
   begin
      pragma Assert (1 + 1 = 3, "arithmetic broke");
      Put_Line ("assertions disabled");
   exception
      when Ada.Assertions.Assertion_Error =>
         Put_Line ("assertion failed");
   end;
end Assertion_Demo;
