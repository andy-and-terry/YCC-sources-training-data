with Ada.Text_IO; use Ada.Text_IO;

--  Hofstadter Q: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
procedure Hofstadter_Q_Sequence is
   Count : constant := 20;
   Q     : array (1 .. Count) of Integer;
begin
   Q (1) := 1;
   Q (2) := 1;
   for N in 3 .. Count loop
      Q (N) := Q (N - Q (N - 1)) + Q (N - Q (N - 2));
   end loop;
   for N in Q'Range loop
      Put (Integer'Image (Q (N)));
   end loop;
   New_Line;
end Hofstadter_Q_Sequence;
