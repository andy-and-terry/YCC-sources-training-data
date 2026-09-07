with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Rendezvous_Demo is
   task type Worker is
      entry Assign (Item : Integer);
      entry Get_Result (Value : out Integer);
   end Worker;

   task body Worker is
      Job : Integer;
   begin
      accept Assign (Item : Integer) do
         Job := Item;
      end Assign;
      accept Get_Result (Value : out Integer) do
         Value := Job * Job;
      end Get_Result;
   end Worker;

   W1, W2 : Worker;
   R1, R2 : Integer;
begin
   W1.Assign (4);
   W2.Assign (7);
   W1.Get_Result (R1);
   W2.Get_Result (R2);
   Put_Line (R1'Image);
   Put_Line (R2'Image);
end Task_Rendezvous_Demo;
