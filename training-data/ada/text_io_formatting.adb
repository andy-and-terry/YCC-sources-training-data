with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Text_IO_Formatting is
begin
   Put (42, Width => 8);
   New_Line;
   Put (255, Width => 0, Base => 16);
   New_Line;
   Put (3.14159, Fore => 3, Aft => 2, Exp => 0);
   New_Line;
   Put (12345.678, Fore => 1, Aft => 3, Exp => 2);
   New_Line;
   Put_Line ("Left" & (1 .. 4 => ' ') & "|");
end Text_IO_Formatting;
