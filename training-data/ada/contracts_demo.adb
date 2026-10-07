with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

procedure Contracts_Demo is
   function Safe_Div (A, B : Integer) return Integer
     with Pre  => B /= 0,
          Post => abs Safe_Div'Result <= abs A;

   function Safe_Div (A, B : Integer) return Integer is
   begin
      return A / B;
   end Safe_Div;

   subtype Even is Integer with Dynamic_Predicate => Even mod 2 = 0;

   E : Even := 8;
begin
   Put_Line ("10 / 3 =" & Integer'Image (Safe_Div (10, 3)));
   Put_Line ("Even value:" & E'Image);
   begin
      E := 7;   --  violates the predicate when assertions are enabled
      Put_Line ("not checked");
   exception
      when Assertion_Error =>
         Put_Line ("predicate violated");
   end;
end Contracts_Demo;
