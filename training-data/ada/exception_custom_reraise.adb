with Ada.Text_IO; use Ada.Text_IO;
procedure Exc_Custom_Reraise is
   Bad : exception;
   procedure Inner is begin raise Bad; end Inner;
begin
   begin
      Inner;
   exception
      when Bad => Put_Line ("inner caught"); raise;
   end;
exception
   when Bad => Put_Line ("outer caught");
end Exc_Custom_Reraise;
