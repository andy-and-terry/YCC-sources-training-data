-- Narayana's cows N(n)=N(n-1)+N(n-3)
with Ada.Text_IO; use Ada.Text_IO;

procedure NarayanaCows is
   type Vec is array (0 .. 9) of Integer;
   V : Vec := (1, 1, 1, others => 0);
begin
   for I in 3 .. 9 loop
      V (I) := V (I - 1) + V (I - 3);
   end loop;
   for I in V'Range loop
      Put (Integer'Image (V (I)));
   end loop;
   New_Line;
end NarayanaCows;
