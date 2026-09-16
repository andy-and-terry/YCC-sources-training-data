with Ada.Text_IO; use Ada.Text_IO;

procedure Observer_Pattern_Demo is
   type Observer_Proc is access procedure (Event : String);

   type Observer_Array is array (Positive range <>) of Observer_Proc;

   procedure Log_Observer (Event : String) is
   begin
      Put_Line ("[Log] " & Event);
   end Log_Observer;

   procedure Alert_Observer (Event : String) is
   begin
      Put_Line ("[Alert] " & Event);
   end Alert_Observer;

   procedure Notify_All (Observers : Observer_Array; Event : String) is
   begin
      for Obs of Observers loop
         Obs (Event);
      end loop;
   end Notify_All;

   Subscribers : constant Observer_Array :=
     (Log_Observer'Access, Alert_Observer'Access);
begin
   Notify_All (Subscribers, "Temperature threshold exceeded");
   Notify_All (Subscribers, "System nominal");
end Observer_Pattern_Demo;
