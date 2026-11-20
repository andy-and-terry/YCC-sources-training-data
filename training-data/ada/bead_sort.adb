with Ada.Text_IO; use Ada.Text_IO;
--  Bead (gravity) sort.
procedure Bead_Sort is
   type Arr is array (1 .. 5) of Integer;
   Nums : constant Arr := (5, 3, 1, 4, 2);
   Cols, Rows : Arr := (others => 0);
begin
   for I in 1 .. 5 loop
      for N of Nums loop
         if N >= I then Cols (I) := Cols (I) + 1; end if;
      end loop;
   end loop;
   for R in 1 .. 5 loop
      for C of Cols loop
         if C >= R then Rows (6 - R) := Rows (6 - R) + 1; end if;
      end loop;
   end loop;
   for V of Rows loop Put (Integer'Image (V)); end loop;
   New_Line;
end Bead_Sort;
