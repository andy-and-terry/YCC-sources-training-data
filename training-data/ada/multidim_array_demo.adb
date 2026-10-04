with Ada.Text_IO; use Ada.Text_IO;

procedure Multidim_Array_Demo is
   type Grid is array (1 .. 3, 1 .. 4) of Integer;
   G : Grid;
begin
   for R in G'Range (1) loop
      for C in G'Range (2) loop
         G (R, C) := R * C;
      end loop;
   end loop;
   for R in G'Range (1) loop
      for C in G'Range (2) loop
         Put (G (R, C)'Image);
      end loop;
      New_Line;
   end loop;
   Put_Line ("Length rows =" & Integer'Image (G'Length (1)));
end Multidim_Array_Demo;
