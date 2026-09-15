with Ada.Text_IO; use Ada.Text_IO;

procedure Dijkstra is
   N : constant Integer := 5;
   Inf : constant Integer := 1_000_000;
   type Graph_Type is array (0 .. N - 1, 0 .. N - 1) of Integer;
   type Dist_Array is array (0 .. N - 1) of Integer;
   type Visited_Array is array (0 .. N - 1) of Boolean;

   Graph : constant Graph_Type :=
     ((0, 4, 0, 0, 8),
      (4, 0, 8, 0, 11),
      (0, 8, 0, 7, 0),
      (0, 0, 7, 0, 9),
      (8, 11, 0, 9, 0));

   Dist    : Dist_Array;
   Visited : Visited_Array := (others => False);

   function Min_Distance return Integer is
      Best     : Integer := Inf;
      Best_Idx : Integer := -1;
   begin
      for V in 0 .. N - 1 loop
         if not Visited (V) and then Dist (V) <= Best then
            Best := Dist (V);
            Best_Idx := V;
         end if;
      end loop;
      return Best_Idx;
   end Min_Distance;

   procedure Run (Source : Integer) is
      U : Integer;
   begin
      for I in Dist'Range loop
         Dist (I) := Inf;
      end loop;
      Dist (Source) := 0;

      for Count in 0 .. N - 2 loop
         U := Min_Distance;
         Visited (U) := True;
         for V in 0 .. N - 1 loop
            if not Visited (V) and then Graph (U, V) /= 0
              and then Dist (U) /= Inf
              and then Dist (U) + Graph (U, V) < Dist (V)
            then
               Dist (V) := Dist (U) + Graph (U, V);
            end if;
         end loop;
      end loop;
   end Run;
begin
   Run (0);
   for I in Dist'Range loop
      Put_Line (Dist (I)'Image);
   end loop;
end Dijkstra;
