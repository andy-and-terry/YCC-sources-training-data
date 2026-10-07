with Ada.Text_IO; use Ada.Text_IO;

procedure Bfs_Traversal is
   N : constant Integer := 6;
   type Graph_Type is array (0 .. N - 1, 0 .. N - 1) of Integer;
   type Bool_Array is array (0 .. N - 1) of Boolean;
   type Queue_Array is array (0 .. N - 1) of Integer;

   Graph : constant Graph_Type :=
     ((0, 1, 1, 0, 0, 0),
      (1, 0, 0, 1, 1, 0),
      (1, 0, 0, 0, 0, 1),
      (0, 1, 0, 0, 0, 0),
      (0, 1, 0, 0, 0, 1),
      (0, 0, 1, 0, 1, 0));

   Visited    : Bool_Array := (others => False);
   Node_Queue : Queue_Array;
   Head, Tail : Integer := 0;

   procedure Enqueue (V : Integer) is
   begin
      Node_Queue (Tail) := V;
      Tail := Tail + 1;
   end Enqueue;

   function Dequeue return Integer is
      V : constant Integer := Node_Queue (Head);
   begin
      Head := Head + 1;
      return V;
   end Dequeue;

   function Is_Empty return Boolean is (Head = Tail);
begin
   Visited (0) := True;
   Enqueue (0);
   while not Is_Empty loop
      declare
         U : constant Integer := Dequeue;
      begin
         Put (U'Image);
         for V in 0 .. N - 1 loop
            if Graph (U, V) = 1 and then not Visited (V) then
               Visited (V) := True;
               Enqueue (V);
            end if;
         end loop;
      end;
   end loop;
   New_Line;
end Bfs_Traversal;
