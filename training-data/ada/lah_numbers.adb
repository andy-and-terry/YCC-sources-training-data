with Ada.Text_IO; use Ada.Text_IO;
procedure Lah_Numbers is
   --  Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
   N : constant := 5;

   function Fact (M : Natural) return Long_Long_Integer is
      F : Long_Long_Integer := 1;
   begin
      for I in 2 .. M loop
         F := F * Long_Long_Integer (I);
      end loop;
      return F;
   end Fact;

   function Comb (M, K : Natural) return Long_Long_Integer is
   begin
      return Fact (M) / (Fact (K) * Fact (M - K));
   end Comb;
begin
   for K in 1 .. N loop
      Put (Long_Long_Integer'Image (Comb (N - 1, K - 1) * Fact (N) / Fact (K)));
   end loop;
   New_Line;
end Lah_Numbers;
