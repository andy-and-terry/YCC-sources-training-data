with Ada.Text_IO; use Ada.Text_IO;

procedure Prims_Mst is
   Num_Vertices : constant := 5;
   Infinity     : constant := 1_000_000;

   type Matrix is array (1 .. Num_Vertices, 1 .. Num_Vertices) of Integer;

   -- 0 means "no edge"; the matrix is symmetric (undirected graph).
   Graph : constant Matrix :=
     ((0, 2, 0, 6, 0),
      (2, 0, 3, 8, 5),
      (0, 3, 0, 0, 7),
      (6, 8, 0, 0, 9),
      (0, 5, 7, 9, 0));

   In_Mst : array (1 .. Num_Vertices) of Boolean := (others => False);
   Key    : array (1 .. Num_Vertices) of Integer := (others => Infinity);
   Parent : array (1 .. Num_Vertices) of Integer := (others => 0);

   function Min_Key return Positive is
      Min_Value : Integer := Infinity + 1;
      Min_Index : Positive := 1;
   begin
      for V in 1 .. Num_Vertices loop
         if not In_Mst (V) and then Key (V) < Min_Value then
            Min_Value := Key (V);
            Min_Index := V;
         end if;
      end loop;
      return Min_Index;
   end Min_Key;

   Total_Weight : Integer := 0;
   U            : Positive;
begin
   Key (1) := 0; -- start the tree from vertex 1

   for Count in 1 .. Num_Vertices loop
      U := Min_Key;
      In_Mst (U) := True;

      for V in 1 .. Num_Vertices loop
         if Graph (U, V) /= 0
           and then not In_Mst (V)
           and then Graph (U, V) < Key (V)
         then
            Key (V)    := Graph (U, V);
            Parent (V) := U;
         end if;
      end loop;
   end loop;

   for V in 2 .. Num_Vertices loop
      Put_Line ("Edge" & Parent (V)'Image & " -" & V'Image &
                "  weight:" & Key (V)'Image);
      Total_Weight := Total_Weight + Key (V);
   end loop;
   Put_Line ("Total MST weight:" & Total_Weight'Image);
end Prims_Mst;
