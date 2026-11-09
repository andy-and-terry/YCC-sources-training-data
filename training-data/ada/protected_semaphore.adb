with Ada.Text_IO; use Ada.Text_IO;
procedure Protected_Semaphore is
   protected Sem is
      entry Acquire;
      procedure Release;
   private
      Free : Boolean := True;
   end Sem;
   protected body Sem is
      entry Acquire when Free is
      begin
         Free := False;
      end Acquire;
      procedure Release is
      begin
         Free := True;
      end Release;
   end Sem;
begin
   Sem.Acquire;
   Put_Line ("in critical section");
   Sem.Release;
end Protected_Semaphore;
