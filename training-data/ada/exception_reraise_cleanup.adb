with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Reraise_Cleanup is
   Custom_Error : exception;

   procedure Work (Fail : Boolean) is
   begin
      Put_Line ("start");
      if Fail then
         raise Custom_Error with "work failed";
      end if;
      Put_Line ("done");
   exception
      when others =>
         Put_Line ("cleanup");
         raise;
   end Work;
begin
   Work (False);
   Work (True);
exception
   when E : Custom_Error =>
      Put_Line ("caught outer");
end Exception_Reraise_Cleanup;
