with Ada.Text_IO; use Ada.Text_IO;

procedure Rendezvous_Demo is
   task Echo is
      entry Say (Msg : String);
   end Echo;

   task body Echo is
   begin
      accept Say (Msg : String) do
         Put_Line ("echo: " & Msg);
      end Say;
   end Echo;
begin
   Echo.Say ("hello");
end Rendezvous_Demo;
