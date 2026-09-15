with Ada.Text_IO; use Ada.Text_IO;

procedure Doubly_Linked_List is
   type Node;
   type Node_Access is access Node;
   type Node is record
      Value : Integer;
      Prev  : Node_Access;
      Next  : Node_Access;
   end record;

   Head, Tail : Node_Access := null;

   procedure Push_Back (Value : Integer) is
      New_Node : constant Node_Access := new Node'(Value, Tail, null);
   begin
      if Tail /= null then
         Tail.Next := New_Node;
      else
         Head := New_Node;
      end if;
      Tail := New_Node;
   end Push_Back;

   procedure Print_Forward is
      Cur : Node_Access := Head;
   begin
      while Cur /= null loop
         Put (Cur.Value'Image);
         Cur := Cur.Next;
      end loop;
      New_Line;
   end Print_Forward;

   procedure Print_Backward is
      Cur : Node_Access := Tail;
   begin
      while Cur /= null loop
         Put (Cur.Value'Image);
         Cur := Cur.Prev;
      end loop;
      New_Line;
   end Print_Backward;
begin
   Push_Back (1);
   Push_Back (2);
   Push_Back (3);
   Print_Forward;
   Print_Backward;
end Doubly_Linked_List;
