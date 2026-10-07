with Ada.Text_IO; use Ada.Text_IO;

procedure Semaphore_Protected is
   protected Semaphore is
      entry Acquire;
      procedure Release;
      function Available return Natural;
   private
      Count : Natural := 2;
   end Semaphore;

   protected body Semaphore is
      entry Acquire when Count > 0 is
      begin
         Count := Count - 1;
      end Acquire;

      procedure Release is
      begin
         Count := Count + 1;
      end Release;

      function Available return Natural is
      begin
         return Count;
      end Available;
   end Semaphore;
begin
   Semaphore.Acquire;
   Semaphore.Acquire;
   Put_Line ("Available after two acquires:" & Natural'Image (Semaphore.Available));
   Semaphore.Release;
   Put_Line ("Available after release:" & Natural'Image (Semaphore.Available));
end Semaphore_Protected;
