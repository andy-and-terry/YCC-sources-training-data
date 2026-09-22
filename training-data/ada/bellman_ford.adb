with Ada.Text_IO; use Ada.Text_IO;

procedure Bellman_Ford is
   Num_Nodes : constant := 5;
   Num_Edges : constant := 10;
   Infinity  : constant := 999_999;

   type Edge is record
      U, V, Weight : Integer;
   end record;

   type Edge_Array is array (1 .. Num_Edges) of Edge;
   type Dist_Array is array (0 .. Num_Nodes - 1) of Integer;

   -- Classic textbook example (s, t, x, y, z mapped to 0 .. 4).
   Edges : constant Edge_Array :=
     ((0, 1, 6), (0, 3, 7), (1, 2, 5), (1, 3, 8), (1, 4, -4),
      (2, 1, -2), (3, 2, -3), (3, 4, 9), (4, 2, 7), (4, 0, 2));

   function Shortest_Paths
     (Source : Integer; Has_Negative_Cycle : out Boolean) return Dist_Array
   is
      Dist : Dist_Array := (others => Infinity);
   begin
      Dist (Source) := 0;
      Has_Negative_Cycle := False;

      for Iteration in 1 .. Num_Nodes - 1 loop
         for I in Edges'Range loop
            declare
               E : constant Edge := Edges (I);
            begin
               if Dist (E.U) /= Infinity
                 and then Dist (E.U) + E.Weight < Dist (E.V)
               then
                  Dist (E.V) := Dist (E.U) + E.Weight;
               end if;
            end;
         end loop;
      end loop;

      -- One more pass: any further relaxation means a negative cycle.
      for I in Edges'Range loop
         declare
            E : constant Edge := Edges (I);
         begin
            if Dist (E.U) /= Infinity
              and then Dist (E.U) + E.Weight < Dist (E.V)
            then
               Has_Negative_Cycle := True;
            end if;
         end;
      end loop;

      return Dist;
   end Shortest_Paths;

   Result       : Dist_Array;
   Has_Neg_Loop : Boolean;
begin
   Result := Shortest_Paths (0, Has_Neg_Loop);
   for D of Result loop
      Put (D'Image);
   end loop;
   New_Line;
   Put_Line ("Negative cycle: " & Has_Neg_Loop'Image);
end Bellman_Ford;
