with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Access_Types_Linked_List is
   type Node;
   type Node_Ptr is access Node;
   type Node is record
      Value : Integer;
      Next : Node_Ptr;
   end record;
   procedure Free is new Ada.Unchecked_Deallocation (Node, Node_Ptr);

   Head : Node_Ptr := null;
   Cur, Prev, Tmp : Node_Ptr;
begin
   for I in 1 .. 5 loop
      Head := new Node'(Value => I, Next => Head);
   end loop;
   Cur := Head; Prev := null;
   while Cur /= null loop
      Tmp := Cur.Next; Cur.Next := Prev; Prev := Cur; Cur := Tmp;
   end loop;
   Head := Prev;
   Cur := Head;
   while Cur /= null loop
      Put (Integer'Image (Cur.Value));
      Tmp := Cur.Next; Free (Cur); Cur := Tmp;
   end loop;
   New_Line;
end Access_Types_Linked_List;
