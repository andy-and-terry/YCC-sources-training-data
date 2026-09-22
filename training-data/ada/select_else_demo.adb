with Ada.Text_IO; use Ada.Text_IO;

procedure Select_Else_Demo is
   task Slow_Worker is
      entry Start;
      entry Get_Result (Value : out Integer);
   end Slow_Worker;

   task body Slow_Worker is
   begin
      delay 0.3; -- not ready to accept Start right away
      accept Start;
      delay 0.3; -- takes a while to compute the result
      accept Get_Result (Value : out Integer) do
         Value := 42;
      end Get_Result;
   end Slow_Worker;

   Result : Integer;
begin
   -- Conditional entry call: Slow_Worker is still inside its startup
   -- delay, so it is not yet waiting at "accept Start" and the else
   -- branch runs instead of blocking.
   select
      Slow_Worker.Start;
      Put_Line ("Start accepted immediately");
   else
      Put_Line ("Slow_Worker was busy, Start not accepted right away");
   end select;

   -- Wait past the worker's startup delay, then make an ordinary
   -- (blocking) entry call, which now rendezvous right away.
   delay 0.4;
   Slow_Worker.Start;
   Put_Line ("Start rendezvous completed");

   -- Timed entry call: the worker needs 0.3s to reach Get_Result, but
   -- this call only waits 0.1s, so it is guaranteed to time out.
   select
      Slow_Worker.Get_Result (Result);
      Put_Line ("Got result:" & Result'Image);
   or
      delay 0.1;
      Put_Line ("Timed out waiting for Get_Result");
   end select;

   -- Finally, wait long enough for the real rendezvous to happen.
   Slow_Worker.Get_Result (Result);
   Put_Line ("Got result:" & Result'Image);
end Select_Else_Demo;
