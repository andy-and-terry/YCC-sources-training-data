with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Periodic_Task_Delay_Until is
   task Ticker;

   task body Ticker is
      Period : constant Time_Span := Milliseconds (50);
      Next   : Time := Clock;
   begin
      for I in 1 .. 3 loop
         Put_Line ("tick" & I'Image);
         Next := Next + Period;
         delay until Next;      --  drift-free periodic release
      end loop;
   end Ticker;
begin
   null;
end Periodic_Task_Delay_Until;
