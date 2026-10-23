with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting;

procedure Calendar_Formatting_Demo is
   --  Build a fixed UTC timestamp so the output is deterministic.
   Start : constant Time :=
     Ada.Calendar.Formatting.Time_Of (2024, 3, 15, 13, 45, 30);
   Next_Day : constant Time := Start + 86_400.0;
begin
   Put_Line (Ada.Calendar.Formatting.Image (Start));
   Put_Line (Ada.Calendar.Formatting.Image (Next_Day));
   Put_Line ("weekday: "
     & Ada.Calendar.Formatting.Day_Name'Image
         (Ada.Calendar.Formatting.Day_Of_Week (Start)));
   Put_Line ("hour:" & Integer'Image (Ada.Calendar.Formatting.Hour (Start)));
   Put_Line ("elapsed seconds:" & Duration'Image (Next_Day - Start));
end Calendar_Formatting_Demo;
