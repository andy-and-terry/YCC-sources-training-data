with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Linked_List is
   generic
      type Element_Type is private;
      with function Image (Item : Element_Type) return String;
   package Linked_List_Pkg is
      procedure Prepend (Item : Element_Type);
      procedure Print_All;
   end Linked_List_Pkg;

   package body Linked_List_Pkg is
      type Node;
      type Node_Access is access Node;
      type Node is record
         Value : Element_Type;
         Next  : Node_Access;
      end record;

      Head : Node_Access := null;

      procedure Prepend (Item : Element_Type) is
      begin
         Head := new Node'(Value => Item, Next => Head);
      end Prepend;

      procedure Print_All is
         Cursor : Node_Access := Head;
      begin
         while Cursor /= null loop
            Put (Image (Cursor.Value) & " ");
            Cursor := Cursor.Next;
         end loop;
         New_Line;
      end Print_All;
   end Linked_List_Pkg;

   function Image_Of_Integer (Item : Integer) return String is (Item'Image);

   package Int_List is new Linked_List_Pkg (Integer, Image_Of_Integer);
begin
   Int_List.Prepend (3);
   Int_List.Prepend (2);
   Int_List.Prepend (1);
   Int_List.Print_All; -- prints "1 2 3" since each Prepend goes to the front
end Generic_Linked_List;
