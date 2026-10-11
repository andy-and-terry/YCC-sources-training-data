with Ada.Text_IO; use Ada.Text_IO;

procedure Protected_Entry_Barrier is
   protected Latch is
      entry Wait;
      procedure Release;
   private
      Open : Boolean := False;
   end Latch;

   protected body Latch is
      entry Wait when Open is
      begin
         null;
      end Wait;

      procedure Release is
      begin
         Open := True;
      end Release;
   end Latch;

   task Worker;
   task body Worker is
   begin
      Latch.Wait;
      Put_Line ("Worker released");
   end Worker;
begin
   delay 0.1;
   Put_Line ("Main releasing latch");
   Latch.Release;
end Protected_Entry_Barrier;
