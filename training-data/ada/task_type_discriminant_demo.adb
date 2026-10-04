with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Type_Discriminant_Demo is
   protected Results is
      procedure Add (Value : Natural);
      function Total return Natural;
   private
      Sum : Natural := 0;
   end Results;

   protected body Results is
      procedure Add (Value : Natural) is
      begin
         Sum := Sum + Value;
      end Add;

      function Total return Natural is
      begin
         return Sum;
      end Total;
   end Results;

   task type Worker (Id : Positive; Count : Positive);

   task body Worker is
      Local : Natural := 0;
   begin
      for I in 1 .. Count loop
         Local := Local + I;
      end loop;
      Results.Add (Local);
   end Worker;

begin
   declare
      W1 : Worker (Id => 1, Count => 10);
      W2 : Worker (Id => 2, Count => 20);
      W3 : Worker (Id => 3, Count => 30);
   begin
      null;  --  block exits only after W1..W3 have terminated
   end;
   Put_Line ("Total =" & Results.Total'Image);
end Task_Type_Discriminant_Demo;
