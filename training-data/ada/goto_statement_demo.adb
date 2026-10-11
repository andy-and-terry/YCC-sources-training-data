with Ada.Text_IO; use Ada.Text_IO;

procedure Goto_Statement_Demo is
   Count : Integer := 0;
begin
   <<Again>>
   Count := Count + 1;
   Put_Line ("Iteration" & Count'Image);
   if Count < 3 then
      goto Again;
   end if;
   Put_Line ("Done");
end Goto_Statement_Demo;
