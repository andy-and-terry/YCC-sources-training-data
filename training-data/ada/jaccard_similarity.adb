with Ada.Text_IO; use Ada.Text_IO;

procedure Jaccard_Similarity is
   type Set is array (0 .. 9) of Boolean;
   A : constant Set := (1 | 2 | 3 | 4 => True, others => False);
   B : constant Set := (3 | 4 | 5 => True, others => False);
   Inter, Uni : Natural := 0;
begin
   for I in Set'Range loop
      if A (I) and B (I) then Inter := Inter + 1; end if;
      if A (I) or B (I) then Uni := Uni + 1; end if;
   end loop;
   Put_Line (Float'Image (Float (Inter) / Float (Uni)));
end Jaccard_Similarity;
