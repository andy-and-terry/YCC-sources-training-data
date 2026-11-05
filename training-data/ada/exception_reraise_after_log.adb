with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Reraise_After_Log is
   Oops : exception;
   procedure Inner is
   begin
      raise Oops;
   end Inner;
begin
   begin
      Inner;
   exception
      when Oops =>
         Put_Line ("logging failure");
         raise;
   end;
exception
   when Oops => Put_Line ("handled at top");
end Exception_Reraise_After_Log;
