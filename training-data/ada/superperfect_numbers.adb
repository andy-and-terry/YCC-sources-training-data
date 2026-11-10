with Ada.Text_IO; use Ada.Text_IO;

procedure Superperfect_Numbers is
   function Sigma (N : Positive) return Positive is
      S : Natural := 0;
   begin
      for D in 1 .. N loop
         if N mod D = 0 then S := S + D; end if;
      end loop;
      return S;
   end Sigma;
begin
   for N in 1 .. 99 loop
      if Sigma (Sigma (N)) = 2 * N then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;  --  2 4 16 64
end Superperfect_Numbers;
