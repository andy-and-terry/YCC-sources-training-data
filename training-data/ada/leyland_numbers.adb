with Ada.Text_IO; use Ada.Text_IO;

--  Leyland numbers: x**y + y**x for x >= y >= 2.
procedure Leyland_Numbers is
begin
   for X in 2 .. 4 loop
      for Y in 2 .. X loop
         Put (Integer'Image (X ** Y + Y ** X));
      end loop;
   end loop;
   New_Line;
end Leyland_Numbers;
