-- Perrin sequence P(n)=P(n-2)+P(n-3)
with Ada.Text_IO; use Ada.Text_IO;

procedure PerrinSequence is
   type Vec is array (0 .. 9) of Integer;
   V : Vec := (3, 0, 2, others => 0);
begin
   for I in 3 .. 9 loop
      V (I) := V (I - 2) + V (I - 3);
   end loop;
   for I in V'Range loop
      Put (Integer'Image (V (I)));
   end loop;
   New_Line;
end PerrinSequence;
