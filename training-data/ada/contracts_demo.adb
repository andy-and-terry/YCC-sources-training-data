with Ada.Text_IO; use Ada.Text_IO;

procedure Contracts_Demo is
   function Safe_Div (A, B : Integer) return Integer
     with Pre  => B /= 0,
          Post => Safe_Div'Result * B <= A + abs B;

   function Safe_Div (A, B : Integer) return Integer is
   begin
      return A / B;
   end Safe_Div;

   subtype Even is Integer with Dynamic_Predicate => Even mod 2 = 0;

   E : Even := 8;
begin
   Put_Line ("10 / 3 =" & Safe_Div (10, 3)'Image);
   Put_Line ("Even value:" & E'Image);
   begin
      E := 7;   --  violates the predicate when assertions are enabled
      Put_Line ("not checked");
   exception
      when Assertion_Error =>
         Put_Line ("predicate violated");
   end;
end Contracts_Demo;
