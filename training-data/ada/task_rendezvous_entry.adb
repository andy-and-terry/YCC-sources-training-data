with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Rendezvous_Entry is
   task Doubler is
      entry Request (Value : in Integer; Result : out Integer);
   end Doubler;

   task body Doubler is
   begin
      for I in 1 .. 3 loop
         accept Request (Value : in Integer; Result : out Integer) do
            Result := Value * 2;
         end Request;
      end loop;
   end Doubler;

   R : Integer;
begin
   for N in 1 .. 3 loop
      Doubler.Request (N * 10, R);
      Put_Line (R'Image);
   end loop;
end Task_Rendezvous_Entry;
