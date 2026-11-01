with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Rendezvous_Ex is
   task Server is
      entry Request (X : Integer; Y : out Integer);
   end Server;

   task body Server is
   begin
      accept Request (X : Integer; Y : out Integer) do
         Y := X * 2;
      end Request;
   end Server;

   R : Integer;
begin
   Server.Request (21, R);
   Put_Line (Integer'Image (R));
end Task_Rendezvous_Ex;
