with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Handling_Ex is
   My_Error : exception;

   procedure Risky (N : Integer) is
   begin
      if N < 0 then raise My_Error; end if;
      Put_Line ("ok" & Integer'Image (10 / N));
   end Risky;
begin
   for V in reverse -1 .. 2 loop
      begin
         Risky (V);
      exception
         when My_Error       => Put_Line ("negative");
         when Constraint_Error => Put_Line ("div by zero");
      end;
   end loop;
end Exception_Handling_Ex;
