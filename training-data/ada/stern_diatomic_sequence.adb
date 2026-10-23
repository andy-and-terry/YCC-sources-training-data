with Ada.Text_IO; use Ada.Text_IO;

--  Stern's diatomic sequence: s(0) = 0, s(1) = 1,
--  s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
procedure Stern_Diatomic_Sequence is
   Count : constant := 20;
   S     : array (0 .. Count - 1) of Integer := (0, 1, others => 0);
begin
   for N in 2 .. Count - 1 loop
      if N mod 2 = 0 then
         S (N) := S (N / 2);
      else
         S (N) := S (N / 2) + S (N / 2 + 1);
      end if;
   end loop;
   for N in S'Range loop
      Put (Integer'Image (S (N)));
   end loop;
   New_Line;
end Stern_Diatomic_Sequence;
