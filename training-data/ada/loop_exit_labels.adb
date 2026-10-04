with Ada.Text_IO; use Ada.Text_IO;

procedure Loop_Exit_Labels is
begin
   Outer :
   for I in 1 .. 5 loop
      for J in 1 .. 5 loop
         exit Outer when I * J > 12;
         Put (Integer'Image (I * J));
      end loop;
      New_Line;
   end loop Outer;
   New_Line;
   Put_Line ("done");
end Loop_Exit_Labels;
