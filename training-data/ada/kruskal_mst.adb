with Ada.Text_IO; use Ada.Text_IO;

procedure Kruskal_Mst is
   type Edge is record
      U, V, Weight : Integer;
   end record;

   type Edge_Array is array (Positive range <>) of Edge;

   Edges : Edge_Array (1 .. 7) :=
     ((0, 1, 2), (0, 3, 6), (1, 2, 3), (1, 3, 8),
      (1, 4, 5), (2, 4, 7), (3, 4, 9));

   N : constant Integer := 5;
   Parent : array (0 .. N - 1) of Integer;

   function Find (X : Integer) return Integer is
   begin
      if Parent (X) /= X then
         Parent (X) := Find (Parent (X));
      end if;
      return Parent (X);
   end Find;

   procedure Sort_Edges (Arr : in out Edge_Array) is
      Temp : Edge;
   begin
      for I in Arr'First .. Arr'Last - 1 loop
         for J in Arr'First .. Arr'Last - 1 - (I - Arr'First) loop
            if Arr (J).Weight > Arr (J + 1).Weight then
               Temp        := Arr (J);
               Arr (J)     := Arr (J + 1);
               Arr (J + 1) := Temp;
            end if;
         end loop;
      end loop;
   end Sort_Edges;

   Total_Weight   : Integer := 0;
   Edges_Used     : Integer := 0;
   Root_U, Root_V : Integer;
begin
   for I in Parent'Range loop
      Parent (I) := I;
   end loop;

   Sort_Edges (Edges);

   for I in Edges'Range loop
      exit when Edges_Used = N - 1;
      Root_U := Find (Edges (I).U);
      Root_V := Find (Edges (I).V);
      if Root_U /= Root_V then
         Parent (Root_U) := Root_V;
         Total_Weight     := Total_Weight + Edges (I).Weight;
         Edges_Used       := Edges_Used + 1;
      end if;
   end loop;

   Put_Line ("MST total weight:" & Total_Weight'Image);
   Put_Line ("Edges used:" & Edges_Used'Image);
end Kruskal_Mst;
