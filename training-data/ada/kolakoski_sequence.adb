with Ada.Text_IO; use Ada.Text_IO;

--  Kolakoski sequence over {1, 2}: the run lengths of the sequence describe itself
procedure Kolakoski_Sequence is
   Count : constant := 20;
   S     : array (1 .. Count + 2) of Integer := (1 => 1, 2 => 2, 3 => 2, others => 0);
   Len   : Integer := 3;
   I     : Integer := 3;
   Sym   : Integer;
begin
   while Len < Count loop
      Sym := 3 - S (Len);
      for K in 1 .. S (I) loop
         Len := Len + 1;
         S (Len) := Sym;
      end loop;
      I := I + 1;
   end loop;
   for J in 1 .. Count loop
      Put (Integer'Image (S (J)));
   end loop;
   New_Line;
end Kolakoski_Sequence;
