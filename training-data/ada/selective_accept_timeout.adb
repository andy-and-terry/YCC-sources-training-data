with Ada.Text_IO; use Ada.Text_IO;
procedure Selective_Accept_Timeout is
   task Worker is
      entry Go;
   end Worker;
   task body Worker is
   begin
      select
         accept Go do
            Put_Line ("go received");
         end Go;
      or
         delay 0.2;
         Put_Line ("timed out");
      end select;
   end Worker;
begin
   delay 0.5;
end Selective_Accept_Timeout;
