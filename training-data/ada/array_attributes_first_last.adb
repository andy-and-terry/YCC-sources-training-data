with Ada.Text_IO; use Ada.Text_IO;
procedure Array_Attrs is
   A : array (-2 .. 2) of Integer := (1, 2, 3, 4, 5);
begin
   Put_Line (Integer'Image (A'First) & Integer'Image (A'Last) & Integer'Image (A'Length));
   for I in reverse A'Range loop
      Put (Integer'Image (A (I)));
   end loop;
   New_Line;
end Array_Attrs;
