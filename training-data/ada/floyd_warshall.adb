with Ada.Text_IO; use Ada.Text_IO;

procedure Floyd_Warshall is
   Inf : constant Integer := 999_999;
   N   : constant Positive := 4;

   type Matrix is array (1 .. N, 1 .. N) of Integer;

   Dist : Matrix :=
     ((0, 5, Inf, 10),
      (Inf, 0, 3, Inf),
      (Inf, Inf, 0, 1),
      (Inf, Inf, Inf, 0));
begin
   for K in 1 .. N loop
      for I in 1 .. N loop
         for J in 1 .. N loop
            if Dist (I, K) < Inf and then Dist (K, J) < Inf
              and then Dist (I, K) + Dist (K, J) < Dist (I, J)
            then
               Dist (I, J) := Dist (I, K) + Dist (K, J);
            end if;
         end loop;
      end loop;
   end loop;

   for I in 1 .. N loop
      for J in 1 .. N loop
         Put (Dist (I, J)'Image & "  ");
      end loop;
      New_Line;
   end loop;
end Floyd_Warshall;
