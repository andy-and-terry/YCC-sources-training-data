with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Type_Array_Demo is
   protected Results is
      procedure Add (Value : Integer);
      function Total return Integer;
   private
      Sum : Integer := 0;
   end Results;

   protected body Results is
      procedure Add (Value : Integer) is
      begin
         Sum := Sum + Value;
      end Add;

      function Total return Integer is
      begin
         return Sum;
      end Total;
   end Results;

   task type Worker is
      entry Start (Id : Positive);
   end Worker;

   task body Worker is
      My_Id : Positive;
   begin
      accept Start (Id : Positive) do
         My_Id := Id;
      end Start;
      Results.Add (My_Id * My_Id);
   end Worker;

   Workers : array (1 .. 4) of Worker;
begin
   for I in Workers'Range loop
      Workers (I).Start (I);
   end loop;
end Task_Type_Array_Demo;
