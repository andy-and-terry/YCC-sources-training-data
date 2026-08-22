with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Demo is
   Division_By_Zero : exception;

   function Safe_Divide (A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Division_By_Zero;
      end if;
      return A / B;
   end Safe_Divide;

begin
   begin
      Put_Line (Safe_Divide (10, 2)'Image);
      Put_Line (Safe_Divide (5, 0)'Image);
   exception
      when Division_By_Zero =>
         Put_Line ("Error: division by zero");
   end;
end Exception_Demo;
