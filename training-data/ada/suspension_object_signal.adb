with Ada.Text_IO; use Ada.Text_IO;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Suspension_Object_Signal is
   --  A Suspension_Object is a binary semaphore: the worker blocks
   --  until another task sets it to True.
   Go : Suspension_Object;

   task Worker;

   task body Worker is
   begin
      Suspend_Until_True (Go);  --  resets the object to False on return
      Put_Line ("worker: released");
   end Worker;
begin
   Put_Line ("main: signalling worker");
   Set_True (Go);
end Suspension_Object_Signal;
