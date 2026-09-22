with Ada.Text_IO; use Ada.Text_IO;

procedure Avl_Tree is
   type Node;
   type Node_Access is access Node;
   type Node is record
      Value  : Integer;
      Height : Integer;
      Left   : Node_Access;
      Right  : Node_Access;
   end record;

   function Height_Of (N : Node_Access) return Integer is
   begin
      if N = null then
         return 0;
      else
         return N.Height;
      end if;
   end Height_Of;

   function Max (A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;

   function Balance_Factor (N : Node_Access) return Integer is
   begin
      if N = null then
         return 0;
      else
         return Height_Of (N.Left) - Height_Of (N.Right);
      end if;
   end Balance_Factor;

   function Rotate_Right (Y : Node_Access) return Node_Access is
      X  : constant Node_Access := Y.Left;
      T2 : constant Node_Access := X.Right;
   begin
      X.Right := Y;
      Y.Left  := T2;
      Y.Height := Max (Height_Of (Y.Left), Height_Of (Y.Right)) + 1;
      X.Height := Max (Height_Of (X.Left), Height_Of (X.Right)) + 1;
      return X;
   end Rotate_Right;

   function Rotate_Left (X : Node_Access) return Node_Access is
      Y  : constant Node_Access := X.Right;
      T2 : constant Node_Access := Y.Left;
   begin
      Y.Left  := X;
      X.Right := T2;
      X.Height := Max (Height_Of (X.Left), Height_Of (X.Right)) + 1;
      Y.Height := Max (Height_Of (Y.Left), Height_Of (Y.Right)) + 1;
      return Y;
   end Rotate_Left;

   function Insert (N : Node_Access; Value : Integer) return Node_Access is
      Result  : Node_Access;
      Balance : Integer;
   begin
      if N = null then
         return new Node'(Value => Value, Height => 1, Left => null, Right => null);
      end if;

      if Value < N.Value then
         N.Left := Insert (N.Left, Value);
      elsif Value > N.Value then
         N.Right := Insert (N.Right, Value);
      else
         return N;
      end if;

      N.Height := Max (Height_Of (N.Left), Height_Of (N.Right)) + 1;
      Balance  := Balance_Factor (N);
      Result   := N;

      if Balance > 1 and then Value < N.Left.Value then
         Result := Rotate_Right (N);
      elsif Balance < -1 and then Value > N.Right.Value then
         Result := Rotate_Left (N);
      elsif Balance > 1 and then Value > N.Left.Value then
         N.Left := Rotate_Left (N.Left);
         Result := Rotate_Right (N);
      elsif Balance < -1 and then Value < N.Right.Value then
         N.Right := Rotate_Right (N.Right);
         Result := Rotate_Left (N);
      end if;

      return Result;
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
   for V of Int_Array'(10, 20, 30, 40, 50, 25) loop
      Root := Insert (Root, V);
   end loop;
   Inorder (Root);
   New_Line;
   Put_Line ("Root value:" & Root.Value'Image);
   Put_Line ("Tree height:" & Root.Height'Image);
end Avl_Tree;
