with Ada.Text_IO; use Ada.Text_IO;

procedure Anonymous_Access_Param is
   type Node;
   type Node_Ptr is access Node;
   type Node is record
      Value : Integer;
      Next  : Node_Ptr;
   end record;

   function Sum (N : access constant Node) return Integer is
     (if N = null then 0 else N.Value + Sum (N.Next));

   List : constant Node_Ptr :=
     new Node'(1, new Node'(2, new Node'(3, null)));
begin
   Put_Line ("Sum:" & Sum (List)'Image);
end Anonymous_Access_Param;
