with Ada.Text_IO; use Ada.Text_IO;

--  Golomb sequence: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
procedure Golomb_Sequence is
   Count : constant := 20;
   G     : array (1 .. Count) of Integer;
begin
   G (1) := 1;
   for N in 2 .. Count loop
      G (N) := 1 + G (N - G (G (N - 1)));
   end loop;
   for N in G'Range loop
      Put (Integer'Image (G (N)));
   end loop;
   New_Line;
end Golomb_Sequence;
