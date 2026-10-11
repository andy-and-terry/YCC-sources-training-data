with Ada.Text_IO; use Ada.Text_IO;

procedure Constraint_Error_Division is
   subtype Percent is Integer range 0 .. 100;

   function Ratio (A, B : Integer) return Percent is
   begin
      return (A * 100) / B;
   end Ratio;
begin
   Put_Line (Ratio (1, 4)'Image);
   begin
      Put_Line (Ratio (5, 0)'Image);
   exception
      when Constraint_Error =>
         Put_Line ("division by zero");
   end;
   begin
      Put_Line (Ratio (3, 1)'Image);
   exception
      when Constraint_Error =>
         Put_Line ("result out of range");
   end;
end Constraint_Error_Division;
