with Ada.Text_IO; use Ada.Text_IO;

procedure Bellman_Ford is
   Inf : constant Integer := 999_999;

   type Edge is record
      From, To, Weight : Integer;
   end record;

   type Edge_Array is array (Positive range <>) of Edge;
   type Int_Array is array (Positive range <>) of Integer;

   procedure Shortest_Paths
     (Edges      : Edge_Array;
      Num_Nodes  : Integer;
      Source     : Integer;
      Dist       : out Int_Array)
   is
   begin
      for I in Dist'Range loop
         Dist (I) := Inf;
      end loop;
      Dist (Source) := 0;

      for Iteration in 1 .. Num_Nodes - 1 loop
         for E of Edges loop
            if Dist (E.From) /= Inf
              and then Dist (E.From) + E.Weight < Dist (E.To)
            then
               Dist (E.To) := Dist (E.From) + E.Weight;
            end if;
         end loop;
      end loop;
   end Shortest_Paths;

   -- 1 -> 2 (4), 1 -> 3 (5), 2 -> 3 (-3), 3 -> 4 (4)
   Edges : constant Edge_Array :=
     ((From => 1, To => 2, Weight => 4),
      (From => 1, To => 3, Weight => 5),
      (From => 2, To => 3, Weight => -3),
      (From => 3, To => 4, Weight => 4));

   Dist : Int_Array (1 .. 4);
begin
   Shortest_Paths (Edges, 4, 1, Dist);
   for I in Dist'Range loop
      Put_Line ("Dist to " & I'Image & ":" & Dist (I)'Image);
   end loop;
end Bellman_Ford;
