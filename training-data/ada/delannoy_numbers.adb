with Ada.Text_IO; use Ada.Text_IO;

procedure Delannoy_Numbers is
   G : array (0 .. 5, 0 .. 5) of Long_Integer;
begin
   for I in 0 .. 5 loop
      for J in 0 .. 5 loop
         if I = 0 or else J = 0 then
            G (I, J) := 1;
         else
            G (I, J) := G (I - 1, J) + G (I, J - 1) + G (I - 1, J - 1);
         end if;
      end loop;
   end loop;
   for N in 0 .. 5 loop
      Put (Long_Integer'Image (G (N, N)));
   end loop;
   New_Line;  --  1 3 13 63 321 1683
end Delannoy_Numbers;
