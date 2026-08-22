with Ada.Text_IO; use Ada.Text_IO;

procedure Factorial is
   function Fact (N : Natural) return Long_Long_Integer is
   begin
      if N = 0 then
         return 1;
      else
         return Long_Long_Integer (N) * Fact (N - 1);
      end if;
   end Fact;
begin
   for I in 0 .. 10 loop
      Put (Fact (I)'Image);
   end loop;
   New_Line;
end Factorial;
