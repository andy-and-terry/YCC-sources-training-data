with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Integer_Text_IO_Demo is
begin
   Put (42, Width => 8);
   New_Line;
   Put (255, Width => 1, Base => 16);
   New_Line;
   Put (-7, Width => 5);
   New_Line;
   for I in 1 .. 3 loop
      Put (I * 100, Width => 6);
   end loop;
   New_Line;
end Integer_Text_IO_Demo;
