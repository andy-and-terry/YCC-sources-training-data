with Ada.Text_IO; use Ada.Text_IO;

procedure Graph_Bfs is
   Num_Nodes : constant := 6;
   type Adjacency is array (0 .. Num_Nodes - 1, 0 .. Num_Nodes - 1) of Boolean;
   type Bool_Array is array (0 .. Num_Nodes - 1) of Boolean;
   type Queue_Array is array (0 .. Num_Nodes - 1) of Integer;

   Graph : Adjacency := (others => (others => False));

   procedure Add_Edge (A, B : Integer) is
   begin
      Graph (A, B) := True;
      Graph (B, A) := True;
   end Add_Edge;

   procedure Bfs (Start : Integer) is
      Visited : Bool_Array := (others => False);
      Queue   : Queue_Array;
      Head    : Natural := 0;
      Tail    : Natural := 0;
      Node    : Integer;
   begin
      Visited (Start) := True;
      Queue (Tail) := Start;
      Tail := Tail + 1;
      while Head < Tail loop
         Node := Queue (Head);
         Head := Head + 1;
         Put (Node'Image);
         for Neighbor in Graph'Range (2) loop
            if Graph (Node, Neighbor) and then not Visited (Neighbor) then
               Visited (Neighbor) := True;
               Queue (Tail) := Neighbor;
               Tail := Tail + 1;
            end if;
         end loop;
      end loop;
      New_Line;
   end Bfs;
begin
   Add_Edge (0, 1);
   Add_Edge (0, 2);
   Add_Edge (1, 3);
   Add_Edge (2, 4);
   Add_Edge (3, 5);
   Bfs (0);
end Graph_Bfs;
