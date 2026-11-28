with Ada.Text_IO; use Ada.Text_IO;

procedure Container_Most_Water is
   H    : constant array (1 .. 9) of Integer := (1, 8, 6, 2, 5, 4, 8, 3, 7);
   Lo   : Integer := H'First;
   Hi   : Integer := H'Last;
   Best : Integer := 0;
begin
   while Lo < Hi loop
      Best := Integer'Max (Best, Integer'Min (H (Lo), H (Hi)) * (Hi - Lo));
      if H (Lo) < H (Hi) then
         Lo := Lo + 1;
      else
         Hi := Hi - 1;
      end if;
   end loop;
   Put_Line (Integer'Image (Best)); -- 49
end Container_Most_Water;
