with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Handler_Demo is
   Custom_Error : exception;

   procedure Risky (N : Integer) is
   begin
      if N < 0 then
         raise Custom_Error;
      end if;
      Put_Line ("ok" & Integer'Image (N));
   end Risky;
begin
   Risky (1);
   Risky (-1);
exception
   when Custom_Error => Put_Line ("caught custom error");
end Exception_Handler_Demo;
