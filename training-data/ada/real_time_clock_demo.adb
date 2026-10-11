with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Real_Time_Clock_Demo is
   Start   : constant Time := Clock;
   Elapsed : Time_Span;
begin
   delay until Start + Milliseconds (50);
   Elapsed := Clock - Start;
   if Elapsed >= Milliseconds (50) then
      Put_Line ("At least 50 ms elapsed");
   end if;
   Put_Line ("Period fits:" & Boolean'Image (To_Duration (Elapsed) < 1.0));
end Real_Time_Clock_Demo;
