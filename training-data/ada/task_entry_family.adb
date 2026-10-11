with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Entry_Family is
   type Channel is range 1 .. 3;

   task Mixer is
      entry Input (Channel) (Level : Integer);
      entry Finish;
   end Mixer;

   task body Mixer is
      Total : Integer := 0;
   begin
      loop
         select
            accept Input (Channel'First) (Level : Integer) do
               Total := Total + Level;
            end Input;
         or
            accept Input (2) (Level : Integer) do
               Total := Total + Level * 2;
            end Input;
         or
            accept Input (3) (Level : Integer) do
               Total := Total + Level * 3;
            end Input;
         or
            accept Finish;
            exit;
         end select;
      end loop;
      Put_Line ("Mix total:" & Total'Image);
   end Mixer;
begin
   Mixer.Input (1) (10);
   Mixer.Input (2) (10);
   Mixer.Input (3) (10);
   Mixer.Finish;
end Task_Entry_Family;
