with Ada.Text_IO; use Ada.Text_IO;

procedure Protected_Counter_Entry is
   protected Counter is
      procedure Increment;
      function Value return Natural;
   private
      Count : Natural := 0;
   end Counter;

   protected body Counter is
      procedure Increment is
      begin
         Count := Count + 1;
      end Increment;

      function Value return Natural is
      begin
         return Count;
      end Value;
   end Counter;

   task type Worker;
   task body Worker is
   begin
      for I in 1 .. 100 loop
         Counter.Increment;
      end loop;
   end Worker;
begin
   declare
      W : array (1 .. 4) of Worker;
   begin
      null;
   end;
   Put_Line ("Total:" & Natural'Image (Counter.Value));
end Protected_Counter_Entry;
