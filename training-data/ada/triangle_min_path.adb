with Ada.Text_IO; use Ada.Text_IO;

procedure Triangle_Min_Path is
   T  : constant array (1 .. 4, 1 .. 4) of Integer :=
     ((2, 0, 0, 0), (3, 4, 0, 0), (6, 5, 7, 0), (4, 1, 8, 3));
   DP : array (1 .. 4) of Integer;
begin
   for I in 1 .. 4 loop
      DP (I) := T (4, I);
   end loop;
   for R in reverse 1 .. 3 loop
      for I in 1 .. R loop
         DP (I) := T (R, I) + Integer'Min (DP (I), DP (I + 1));
      end loop;
   end loop;
   Put_Line (Integer'Image (DP (1))); -- 11
end Triangle_Min_Path;
