with Ada.Text_IO; use Ada.Text_IO;

--  Ulam numbers: after 1 and 2, each term is the smallest number that is
--  the sum of two distinct earlier terms in exactly one way
procedure Ulam_Numbers is
   Count : constant := 15;
   Terms : array (1 .. Count) of Integer := (1, 2, others => 0);
   Found : Integer := 2;
   Cand  : Integer := 2;
   Ways  : Integer;
begin
   while Found < Count loop
      Cand := Cand + 1;
      Ways := 0;
      for A in 1 .. Found loop
         for B in A + 1 .. Found loop
            if Terms (A) + Terms (B) = Cand then
               Ways := Ways + 1;
            end if;
         end loop;
      end loop;
      if Ways = 1 then
         Found := Found + 1;
         Terms (Found) := Cand;
      end if;
   end loop;
   for K in Terms'Range loop
      Put (Integer'Image (Terms (K)));
   end loop;
   New_Line;
end Ulam_Numbers;
