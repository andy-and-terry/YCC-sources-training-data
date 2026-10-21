with Ada.Text_IO; use Ada.Text_IO;

--  Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
procedure Padovan_Sequence is
   type Vec is array (Natural range <>) of Natural;
   N : constant := 15;
   P : Vec (0 .. N - 1);
begin
   P (0 .. 2) := (1, 1, 1);
   for I in 3 .. N - 1 loop
      P (I) := P (I - 2) + P (I - 3);
   end loop;
   for I in P'Range loop
      Put (Natural'Image (P (I)));
   end loop;
   New_Line;
end Padovan_Sequence;
