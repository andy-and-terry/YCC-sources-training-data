with Ada.Text_IO; use Ada.Text_IO;
procedure Pingpong_Task_Rendezvous is
   task Server is
      entry Ping (N : Integer);
   end Server;
   task body Server is
   begin
      for I in 1 .. 3 loop
         accept Ping (N : Integer) do
            Put_Line ("pong" & Integer'Image (N));
         end Ping;
      end loop;
   end Server;
begin
   for I in 1 .. 3 loop
      Server.Ping (I);
   end loop;
end Pingpong_Task_Rendezvous;
