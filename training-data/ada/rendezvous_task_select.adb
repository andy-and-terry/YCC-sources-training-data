with Ada.Text_IO; use Ada.Text_IO;

procedure Rendezvous_Task_Select is
   task Server is
      entry Put (X : Integer);
      entry Stop;
   end Server;

   task body Server is
      Sum : Integer := 0;
   begin
      loop
         select
            accept Put (X : Integer) do
               Sum := Sum + X;
            end Put;
         or
            accept Stop;
            exit;
         end select;
      end loop;
      Put_Line ("Sum =" & Integer'Image (Sum));
   end Server;
begin
   Server.Put (10);
   Server.Put (32);
   Server.Stop;
end Rendezvous_Task_Select;
