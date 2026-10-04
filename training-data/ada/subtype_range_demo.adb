with Ada.Text_IO; use Ada.Text_IO;

procedure Subtype_Range_Demo is
   subtype Percent is Integer range 0 .. 100;
   subtype Positive_Small is Positive range 1 .. 10;

   function Clamp (V : Integer) return Percent is
   begin
      if V < Percent'First then
         return Percent'First;
      elsif V > Percent'Last then
         return Percent'Last;
      else
         return V;
      end if;
   end Clamp;

   P : Percent := 50;
   N : Integer := 150;
begin
   Put_Line ("Clamp 150 =" & Clamp (N)'Image);
   Put_Line ("Clamp -5  =" & Clamp (-5)'Image);
   Put_Line ("Valid: " & Boolean'Image (N in Percent));

   begin
      P := Percent (N);  --  raises Constraint_Error
      Put_Line ("not reached");
   exception
      when Constraint_Error =>
         Put_Line ("Constraint_Error: value out of range");
   end;

   declare
      S : Positive_Small := 10;
   begin
      S := S + 1;
      Put_Line ("not reached" & S'Image);
   exception
      when Constraint_Error =>
         Put_Line ("Positive_Small overflow caught");
   end;
end Subtype_Range_Demo;
