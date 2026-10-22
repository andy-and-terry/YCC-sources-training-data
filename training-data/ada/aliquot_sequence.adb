with Ada.Text_IO; use Ada.Text_IO;

--  Aliquot sequence: repeatedly replace n by the sum of its proper divisors until 0
procedure Aliquot_Sequence is
   N   : Integer := 12;
   Sum : Integer;
begin
   Put (Integer'Image (N));
   while N > 0 loop
      Sum := 0;
      for D in 1 .. N / 2 loop
         if N mod D = 0 then
            Sum := Sum + D;
         end if;
      end loop;
      N := Sum;
      Put (Integer'Image (N));
   end loop;
   New_Line;
end Aliquot_Sequence;
