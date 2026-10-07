with Ada.Text_IO; use Ada.Text_IO;

procedure Nested_Subprogram_Demo is
   function Sum_Of_Squares (N : Natural) return Natural is
      Total : Natural := 0;

      --  Nested procedure can see and modify Total from its enclosing scope.
      procedure Add_Square (K : Natural) is
      begin
         Total := Total + K * K;
      end Add_Square;
   begin
      for I in 1 .. N loop
         Add_Square (I);
      end loop;
      return Total;
   end Sum_Of_Squares;
begin
   Put_Line ("Sum of squares 1..5 =" & Sum_Of_Squares (5)'Image);
   Put_Line ("Sum of squares 1..10 =" & Sum_Of_Squares (10)'Image);
end Nested_Subprogram_Demo;
