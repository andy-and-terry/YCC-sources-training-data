with Ada.Text_IO; use Ada.Text_IO;
--  Wilson's theorem primality test.
procedure Wilson_Prime_Check is
   function Wilson (N : Positive) return Boolean is
      F : Long_Long_Integer := 1;
   begin
      if N < 2 then return False; end if;
      for I in 2 .. N - 1 loop
         F := (F * Long_Long_Integer (I)) mod Long_Long_Integer (N);
      end loop;
      return F = Long_Long_Integer (N - 1);
   end Wilson;
begin
   for N in 2 .. 19 loop
      if Wilson (N) then Put (Integer'Image (N)); end if;
   end loop;
   New_Line;
end Wilson_Prime_Check;
