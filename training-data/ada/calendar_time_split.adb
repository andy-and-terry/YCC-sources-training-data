with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Calendar_Time_Split is
   T : constant Time := Time_Of (2024, 3, 15, 13.5 * 3600.0);
   Y : Year_Number;
   M : Month_Number;
   D : Day_Number;
   S : Day_Duration;
begin
   Split (T, Y, M, D, S);
   Put_Line (Y'Image & M'Image & D'Image);
   Put_Line ("Seconds into day:" & Integer'Image (Integer (S)));
   Put_Line ("Next day:" & Day_Number'Image (Day (T + 86_400.0)));
end Calendar_Time_Split;
