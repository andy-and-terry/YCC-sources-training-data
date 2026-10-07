with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Abort_Demo is
   task Long_Runner is
      entry Start;
   end Long_Runner;

   task body Long_Runner is
   begin
      accept Start;
      for I in 1 .. 10 loop
         delay 0.2;
         Put_Line ("Long_Runner working, step" & I'Image);
      end loop;
      Put_Line ("Long_Runner finished normally");
   end Long_Runner;
begin
   Long_Runner.Start;
   delay 0.5; -- let it complete a couple of steps
   Put_Line ("Main: aborting Long_Runner");
   abort Long_Runner;
   delay 0.2;
   Put_Line ("Main: Long_Runner terminated? " & Long_Runner'Terminated'Image);
end Task_Abort_Demo;
