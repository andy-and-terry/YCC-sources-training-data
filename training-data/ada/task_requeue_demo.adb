with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Requeue_Demo is
   protected Gate is
      entry Enter;
      entry Admit;
      procedure Open;
   private
      Is_Open : Boolean := False;
   end Gate;

   protected body Gate is
      entry Enter when True is
      begin
         requeue Admit;
      end Enter;

      entry Admit when Is_Open is
      begin
         Put_Line ("Admitted");
      end Admit;

      procedure Open is
      begin
         Is_Open := True;
      end Open;
   end Gate;

   task Visitor;
   task body Visitor is
   begin
      Gate.Enter;
   end Visitor;
begin
   delay 0.1;
   Gate.Open;
end Task_Requeue_Demo;
