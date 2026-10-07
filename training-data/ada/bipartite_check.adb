with Ada.Text_IO; use Ada.Text_IO;

procedure Bipartite_Check is
   Num_Nodes : constant := 4;
   type Adjacency is array (0 .. Num_Nodes - 1, 0 .. Num_Nodes - 1) of Boolean;
   type Color_Array is array (0 .. Num_Nodes - 1) of Integer;
   type Queue_Array is array (0 .. Num_Nodes - 1) of Integer;

   procedure Add_Edge (G : in out Adjacency; A, B : Integer) is
   begin
      G (A, B) := True;
      G (B, A) := True;
   end Add_Edge;

   -- Two-colors the graph via BFS; a conflict (a neighbor already
   -- sharing the current node's color) means it isn't bipartite.
   function Is_Bipartite (Graph : Adjacency) return Boolean is
      Color : Color_Array := (others => -1);
      Queue : Queue_Array;
      Head, Tail, Node : Integer;
   begin
      for Start in 0 .. Num_Nodes - 1 loop
         if Color (Start) = -1 then
            Color (Start) := 0;
            Head := 0;
            Tail := 0;
            Queue (Tail) := Start;
            Tail := Tail + 1;
            while Head < Tail loop
               Node := Queue (Head);
               Head := Head + 1;
               for Neighbor in Graph'Range (2) loop
                  if Graph (Node, Neighbor) then
                     if Color (Neighbor) = -1 then
                        Color (Neighbor) := 1 - Color (Node);
                        Queue (Tail) := Neighbor;
                        Tail := Tail + 1;
                     elsif Color (Neighbor) = Color (Node) then
                        return False;
                     end if;
                  end if;
               end loop;
            end loop;
         end if;
      end loop;
      return True;
   end Is_Bipartite;

   Even_Cycle : Adjacency := (others => (others => False));
   Odd_Cycle  : Adjacency := (others => (others => False));
begin
   Add_Edge (Even_Cycle, 0, 1);
   Add_Edge (Even_Cycle, 1, 2);
   Add_Edge (Even_Cycle, 2, 3);
   Add_Edge (Even_Cycle, 3, 0);
   Put_Line ("Even cycle bipartite: " & Is_Bipartite (Even_Cycle)'Image);

   Add_Edge (Odd_Cycle, 0, 1);
   Add_Edge (Odd_Cycle, 1, 2);
   Add_Edge (Odd_Cycle, 2, 0);
   Put_Line ("Odd cycle bipartite: " & Is_Bipartite (Odd_Cycle)'Image);
end Bipartite_Check;
