with Ada.Text_IO; use Ada.Text_IO;
procedure Aliquot_Sequence is
   --  Aliquot sequence: replace n by the sum of its proper divisors.
   function Aliquot_Sum (N : Positive) return Natural is
      S : Natural := 0;
   begin
      for D in 1 .. N / 2 loop
         if N mod D = 0 then
            S := S + D;
         end if;
      end loop;
      return S;
   end Aliquot_Sum;

   N     : Natural := 12;
   Count : Natural := 0;
begin
   Put (Natural'Image (N));
   while N > 1 and Count < 19 loop
      N := Aliquot_Sum (N);
      Put (Natural'Image (N));
      Count := Count + 1;
   end loop;
   New_Line;
end Aliquot_Sequence;
