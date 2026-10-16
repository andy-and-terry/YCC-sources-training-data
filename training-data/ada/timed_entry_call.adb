with Ada.Text_IO; use Ada.Text_IO;

procedure Timed_Entry_Call is
   task Slow is
      entry Request;
   end Slow;

   task body Slow is
   begin
      delay 0.5;
      accept Request;
   end Slow;
begin
   select
      Slow.Request;
      Put_Line ("Request accepted");
   or
      delay 0.05;
      Put_Line ("Timed out waiting");
   end select;
   Slow.Request;
   Put_Line ("Second request accepted");
end Timed_Entry_Call;
