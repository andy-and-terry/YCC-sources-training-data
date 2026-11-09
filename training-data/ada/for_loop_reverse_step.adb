with Ada.Text_IO; use Ada.Text_IO;
procedure For_Loop_Reverse_Step is
begin
   for I in reverse 1 .. 5 loop
      Put (Integer'Image (I));
   end loop;
   New_Line;
   for I in 0 .. 5 loop
      if I mod 2 = 0 then
         Put (Integer'Image (I));
      end if;
   end loop;
   New_Line;
end For_Loop_Reverse_Step;
