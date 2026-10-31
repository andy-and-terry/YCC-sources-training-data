with Ada.Text_IO; use Ada.Text_IO;

procedure Odd_Cubes_Identity is
   function Cube_From_Odds (N : Integer) return Integer is
      Start : constant Integer := N * N - N + 1;
      Sum   : Integer := 0;
   begin
      for I in 0 .. N - 1 loop
         Sum := Sum + Start + 2 * I;
      end loop;
      return Sum;
   end Cube_From_Odds;
begin
   for N in 1 .. 5 loop
      Put_Line (Integer'Image (N) & Integer'Image (Cube_From_Odds (N)) & " "
                & Boolean'Image (Cube_From_Odds (N) = N ** 3));
   end loop;
end Odd_Cubes_Identity;
