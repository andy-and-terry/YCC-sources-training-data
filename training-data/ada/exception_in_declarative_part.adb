with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_In_Declarative_Part is
   subtype Small is Integer range 1 .. 10;

   procedure Make (N : Integer) is
      V : Small := N;
   begin
      Put_Line ("Made" & V'Image);
   exception
      when Constraint_Error =>
         Put_Line ("Constraint_Error raised in body for" & N'Image);
   end Make;
begin
   Make (5);
   begin
      Make (50);
   exception
      when others => Put_Line ("not reached: handled inside Make");
   end;
end Exception_In_Declarative_Part;
