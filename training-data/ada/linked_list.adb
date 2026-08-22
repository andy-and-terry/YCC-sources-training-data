with Ada.Text_IO; use Ada.Text_IO;

procedure Linked_List is
   type Node;
   type Node_Access is access Node;
   type Node is record
      Value : Integer;
      Next  : Node_Access;
   end record;

   Head : Node_Access := null;

   procedure Push (Value : Integer) is
      New_Node : constant Node_Access := new Node'(Value => Value, Next => Head);
   begin
      Head := New_Node;
   end Push;

   procedure Print_List is
      Cur : Node_Access := Head;
   begin
      while Cur /= null loop
         Put (Cur.Value'Image);
         Cur := Cur.Next;
      end loop;
      New_Line;
   end Print_List;
begin
   for I in 1 .. 4 loop
      Push (I);
   end loop;
   Print_List;
end Linked_List;
