with Ada.Text_IO; use Ada.Text_IO;

procedure Segment_Tree is
   type Int_Array is array (Natural range <>) of Integer;

   Data : constant Int_Array (0 .. 5) := (1, 3, 5, 7, 9, 11);
   N    : constant Natural := Data'Length;
   Tree : array (0 .. 4 * N) of Integer := (others => 0);

   procedure Build (Node, L, R : Natural) is
      Mid : Natural;
   begin
      if L = R then
         Tree (Node) := Data (L);
      else
         Mid := (L + R) / 2;
         Build (2 * Node + 1, L, Mid);
         Build (2 * Node + 2, Mid + 1, R);
         Tree (Node) := Tree (2 * Node + 1) + Tree (2 * Node + 2);
      end if;
   end Build;

   function Query (Node, L, R, Ql, Qr : Natural) return Integer is
      Mid : Natural;
   begin
      if Qr < L or else R < Ql then
         return 0;
      elsif Ql <= L and then R <= Qr then
         return Tree (Node);
      else
         Mid := (L + R) / 2;
         return Query (2 * Node + 1, L, Mid, Ql, Qr) +
                Query (2 * Node + 2, Mid + 1, R, Ql, Qr);
      end if;
   end Query;

   procedure Update (Node, L, R, Idx, Value : Natural) is
      Mid : Natural;
   begin
      if L = R then
         Tree (Node) := Value;
      else
         Mid := (L + R) / 2;
         if Idx <= Mid then
            Update (2 * Node + 1, L, Mid, Idx, Value);
         else
            Update (2 * Node + 2, Mid + 1, R, Idx, Value);
         end if;
         Tree (Node) := Tree (2 * Node + 1) + Tree (2 * Node + 2);
      end if;
   end Update;
begin
   Build (0, 0, N - 1);
   Put_Line (Query (0, 0, N - 1, 1, 3)'Image);
   Update (0, 0, N - 1, 2, 100);
   Put_Line (Query (0, 0, N - 1, 1, 3)'Image);
end Segment_Tree;
