with Ada.Text_IO; use Ada.Text_IO;

procedure List_Mode is
   Items  : constant array (1 .. 6) of Integer := (1, 2, 2, 3, 3, 4);
   Counts : array (0 .. 9) of Natural := (others => 0);
   Top    : Natural := 0;
begin
   for X of Items loop
      Counts (X) := Counts (X) + 1;
      Top := Natural'Max (Top, Counts (X));
   end loop;
   for V in Counts'Range loop
      if Counts (V) = Top then
         Put (Integer'Image (V));
      end if;
   end loop;
   New_Line;
end List_Mode;
