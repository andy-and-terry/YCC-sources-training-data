with Ada.Text_IO; use Ada.Text_IO;

procedure Tasks_Protected_Queue is
   protected Buffer is
      entry Put (X : Integer);
      entry Get (X : out Integer);
   private
      Value : Integer := 0;
      Full : Boolean := False;
   end Buffer;

   protected body Buffer is
      entry Put (X : Integer) when not Full is
      begin Value := X; Full := True; end Put;
      entry Get (X : out Integer) when Full is
      begin X := Value; Full := False; end Get;
   end Buffer;

   task Producer;
   task body Producer is
   begin
      for I in 1 .. 5 loop Buffer.Put (I * I); end loop;
   end Producer;

   Sum, V : Integer := 0;
begin
   for I in 1 .. 5 loop
      Buffer.Get (V);
      Sum := Sum + V;
   end loop;
   Put_Line ("sum =" & Integer'Image (Sum));
end Tasks_Protected_Queue;
