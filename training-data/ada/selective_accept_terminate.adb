with Ada.Text_IO; use Ada.Text_IO;

procedure Selective_Accept_Terminate is
   task Server is
      entry Square (X : Integer; Result : out Integer);
   end Server;

   task body Server is
   begin
      loop
         select
            accept Square (X : Integer; Result : out Integer) do
               Result := X * X;
            end Square;
         or
            terminate;
         end select;
      end loop;
   end Server;

   R : Integer;
begin
   for I in 1 .. 3 loop
      Server.Square (I, R);
      Put_Line (I'Image & "^2 =" & R'Image);
   end loop;
end Selective_Accept_Terminate;
