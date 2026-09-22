with Ada.Text_IO; use Ada.Text_IO;

procedure Dijkstra is
   Num_Nodes : constant := 5;
   Infinity  : constant := 999_999;
   type Weight_Matrix is array (0 .. Num_Nodes - 1, 0 .. Num_Nodes - 1) of Integer;
   type Dist_Array is array (0 .. Num_Nodes - 1) of Integer;
   type Bool_Array is array (0 .. Num_Nodes - 1) of Boolean;

   Graph : constant Weight_Matrix :=
     ((0, 4, 0, 0, 8),
      (4, 0, 3, 0, 0),
      (0, 3, 0, 2, 0),
      (0, 0, 2, 0, 5),
      (8, 0, 0, 5, 0));

   function Shortest_Paths (Source : Integer) return Dist_Array is
      Dist    : Dist_Array := (others => Infinity);
      Visited : Bool_Array := (others => False);
      U, Best : Integer;
   begin
      Dist (Source) := 0;
      for Iteration in 1 .. Num_Nodes loop
         U := -1;
         Best := Infinity + 1;
         for Node in Dist'Range loop
            if not Visited (Node) and then Dist (Node) < Best then
               Best := Dist (Node);
               U := Node;
            end if;
         end loop;
         exit when U = -1;
         Visited (U) := True;
         for V in Graph'Range (2) loop
            if Graph (U, V) > 0 and then Dist (U) + Graph (U, V) < Dist (V) then
               Dist (V) := Dist (U) + Graph (U, V);
            end if;
         end loop;
      end loop;
      return Dist;
   end Shortest_Paths;

   Result : constant Dist_Array := Shortest_Paths (0);
begin
   for D of Result loop
      Put (D'Image);
   end loop;
   New_Line;
end Dijkstra;
