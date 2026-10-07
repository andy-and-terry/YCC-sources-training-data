with Ada.Text_IO; use Ada.Text_IO;

procedure Exception_Reraise_Demo is
   Failure : exception;

   procedure Inner is
   begin
      raise Failure with "inner failed";
   end Inner;

   procedure Middle is
   begin
      Inner;
   exception
      when Failure =>
         Put_Line ("middle: cleaning up, re-raising");
         raise;
   end Middle;
begin
   Middle;
exception
   when Failure =>
      Put_Line ("outer: handled Failure");
end Exception_Reraise_Demo;
