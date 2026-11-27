with Ada.Text_IO; use Ada.Text_IO;

procedure Lah_Numbers is
   function Lah (N, K : Positive) return Long_Long_Integer is
      C : Long_Long_Integer := 1;
      F : Long_Long_Integer := 1;
   begin
      for I in 0 .. K - 2 loop
         C := C * Long_Long_Integer (N - 1 - I) / Long_Long_Integer (I + 1);
      end loop;
      for I in K + 1 .. N loop
         F := F * Long_Long_Integer (I);
      end loop;
      return C * F;
   end Lah;
begin
   for N in 1 .. 5 loop
      for K in 1 .. N loop
         Put (Long_Long_Integer'Image (Lah (N, K)));
      end loop;
      New_Line;
   end loop;
end Lah_Numbers;
