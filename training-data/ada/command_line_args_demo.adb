with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Command_Line_Args_Demo is
begin
   if Argument_Count = 0 then
      Put_Line ("No arguments supplied; pass names on the command line.");
   else
      for I in 1 .. Argument_Count loop
         Put_Line ("Arg" & I'Image & ": " & Argument (I));
      end loop;
   end if;
end Command_Line_Args_Demo;
