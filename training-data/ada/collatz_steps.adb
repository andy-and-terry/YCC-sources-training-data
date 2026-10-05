with Ada.Text_IO; use Ada.Text_IO;

procedure Collatz_Steps is
   function Steps (Start : Positive) return Natural is
      N : Long_Long_Integer := Long_Long_Integer (Start);
      Count : Natural := 0;
   begin
      while N /= 1 loop
         if N mod 2 = 0 then
            N := N / 2;
         else
            N := 3 * N + 1;
         end if;
         Count := Count + 1;
      end loop;
      return Count;
   end Steps;
begin
   for Start in Positive range 1 .. 10 loop
      Put_Line (Start'Image & " ->" & Steps (Start)'Image);
   end loop;
end Collatz_Steps;
