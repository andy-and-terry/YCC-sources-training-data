with Ada.Text_IO; use Ada.Text_IO;

--  Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
procedure Delannoy_Numbers is
   Last : constant := 9;
   D    : array (0 .. Last, 0 .. Last) of Long_Integer := (others => (others => 1));
begin
   for M in 1 .. Last loop
      for N in 1 .. Last loop
         D (M, N) := D (M - 1, N) + D (M, N - 1) + D (M - 1, N - 1);
      end loop;
   end loop;
   for K in 0 .. Last loop
      Put (Long_Integer'Image (D (K, K)));
   end loop;
   New_Line;
end Delannoy_Numbers;
