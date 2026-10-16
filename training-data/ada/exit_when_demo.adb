with Ada.Text_IO; use Ada.Text_IO;

procedure Exit_When_Demo is
   N : Natural := 27;
   Steps : Natural := 0;
begin
   loop
      exit when N = 1;
      if N mod 2 = 0 then
         N := N / 2;
      else
         N := 3 * N + 1;
      end if;
      Steps := Steps + 1;
   end loop;
   Put_Line ("Steps:" & Steps'Image);
end Exit_When_Demo;
