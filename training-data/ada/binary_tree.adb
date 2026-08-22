with Ada.Text_IO; use Ada.Text_IO;

procedure Binary_Tree is
   type Node;
   type Node_Access is access Node;
   type Node is record
      Value : Integer;
      Left  : Node_Access;
      Right : Node_Access;
   end record;

   function Insert (N : Node_Access; Value : Integer) return Node_Access is
   begin
      if N = null then
         return new Node'(Value => Value, Left => null, Right => null);
      end if;
      if Value < N.Value then
         N.Left := Insert (N.Left, Value);
      else
         N.Right := Insert (N.Right, Value);
      end if;
      return N;
   end Insert;

   procedure Inorder (N : Node_Access) is
   begin
      if N /= null then
         Inorder (N.Left);
         Put (N.Value'Image);
         Inorder (N.Right);
      end if;
   end Inorder;

   type Int_Array is array (Positive range <>) of Integer;

   Root : Node_Access := null;
begin
   for V of Int_Array'(5, 3, 8, 1, 4, 7, 9) loop
      Root := Insert (Root, V);
   end loop;
   Inorder (Root);
   New_Line;
end Binary_Tree;
