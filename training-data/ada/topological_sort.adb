with Ada.Text_IO; use Ada.Text_IO;

procedure Topological_Sort is
   Num_Nodes : constant := 6;
   type Adjacency is array (0 .. Num_Nodes - 1, 0 .. Num_Nodes - 1) of Boolean;
   type Bool_Array is array (0 .. Num_Nodes - 1) of Boolean;
   type Order_Array is array (0 .. Num_Nodes - 1) of Integer;

   Graph   : Adjacency := (others => (others => False));
   Visited : Bool_Array := (others => False);
   Order   : Order_Array;
   Pos     : Natural := Order'Last;

   procedure Add_Edge (A, B : Integer) is
   begin
      Graph (A, B) := True;
   end Add_Edge;

   procedure Visit (Node : Integer) is
   begin
      Visited (Node) := True;
      for Neighbor in Graph'Range (2) loop
         if Graph (Node, Neighbor) and then not Visited (Neighbor) then
            Visit (Neighbor);
         end if;
      end loop;
      Order (Pos) := Node;
      Pos := Pos - 1;
   end Visit;
begin
   Add_Edge (5, 2);
   Add_Edge (5, 0);
   Add_Edge (4, 0);
   Add_Edge (4, 1);
   Add_Edge (2, 3);
   Add_Edge (3, 1);

   for Node in 0 .. Num_Nodes - 1 loop
      if not Visited (Node) then
         Visit (Node);
      end if;
   end loop;

   for Node of Order loop
      Put (Node'Image);
   end loop;
   New_Line;
end Topological_Sort;
