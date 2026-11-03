with Ada.Text_IO; use Ada.Text_IO;

procedure Triangular_Numbers is
   Sum : Natural := 0;
begin
   for N in 1 .. 10 loop
      Sum := Sum + N;
      Put (Natural'Image (Sum));
   end loop;
   New_Line;
end Triangular_Numbers;
