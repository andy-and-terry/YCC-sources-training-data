with Ada.Text_IO; use Ada.Text_IO;

--  Ulam numbers: next term is the smallest value with exactly one representation as a sum of two distinct terms
procedure Ulam_Numbers is
   Count : constant := 15;
   U     : array (1 .. Count) of Integer := (1 => 1, 2 => 2, others => 0);
   N     : Integer := 2;
   Cand  : Integer := 2;
   Ways  : Integer;
begin
   while N < Count loop
      Cand := Cand + 1;
      Ways := 0;
      for A in 1 .. N loop
         for B in A + 1 .. N loop
            if U (A) + U (B) = Cand then
               Ways := Ways + 1;
            end if;
         end loop;
      end loop;
      if Ways = 1 then
         N := N + 1;
         U (N) := Cand;
      end if;
   end loop;
   for J in 1 .. Count loop
      Put (Integer'Image (U (J)));
   end loop;
   New_Line;
end Ulam_Numbers;
