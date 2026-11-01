with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Slices_Ex is
   type Vec is array (Positive range <>) of Integer;
   A : Vec (1 .. 6) := (1, 2, 3, 4, 5, 6);
begin
   A (1 .. 3) := A (4 .. 6);
   for E of A loop
      Put (Integer'Image (E));
   end loop;
   New_Line;
   Put_Line (Integer'Image (A'Length) & Integer'Image (A'First));
end Array_Slices_Ex;
