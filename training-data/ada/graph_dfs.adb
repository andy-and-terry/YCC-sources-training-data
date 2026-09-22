with Ada.Text_IO; use Ada.Text_IO;

procedure Graph_Dfs is
   Num_Nodes : constant := 6;
   type Adjacency is array (0 .. Num_Nodes - 1, 0 .. Num_Nodes - 1) of Boolean;
   type Bool_Array is array (0 .. Num_Nodes - 1) of Boolean;

   Graph   : Adjacency := (others => (others => False));
   Visited : Bool_Array := (others => False);

   procedure Add_Edge (A, B : Integer) is
   begin
      Graph (A, B) := True;
      Graph (B, A) := True;
   end Add_Edge;

   procedure Visit (Node : Integer) is
   begin
      Visited (Node) := True;
      Put (Node'Image);
      for Neighbor in Graph'Range (2) loop
         if Graph (Node, Neighbor) and then not Visited (Neighbor) then
            Visit (Neighbor);
         end if;
      end loop;
   end Visit;
begin
   Add_Edge (0, 1);
   Add_Edge (0, 2);
   Add_Edge (1, 3);
   Add_Edge (2, 4);
   Add_Edge (3, 5);
   Visit (0);
   New_Line;
end Graph_Dfs;
