with Ada.Text_IO; use Ada.Text_IO;

procedure Collatz_Sequence is
   N     : Long_Long_Integer := 27;
   Steps : Natural := 0;
begin
   Put (N'Image);
   while N /= 1 loop
      if N mod 2 = 0 then
         N := N / 2;
      else
         N := 3 * N + 1;
      end if;
      Steps := Steps + 1;
      Put (N'Image);
   end loop;
   New_Line;
   Put_Line ("Steps: " & Steps'Image);
end Collatz_Sequence;
