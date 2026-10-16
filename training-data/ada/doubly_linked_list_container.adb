with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;

procedure Doubly_Linked_List_Container is
   package Int_Lists is new Ada.Containers.Doubly_Linked_Lists (Integer);
   use Int_Lists;

   L : List;
   Pos : Cursor;
begin
   L.Append (2);
   L.Append (3);
   L.Prepend (1);
   Pos := L.Find (3);
   L.Insert (Before => Pos, New_Item => 99);
   for E of L loop
      Put (E'Image);
   end loop;
   New_Line;
   L.Reverse_Elements;
   for E of L loop
      Put (E'Image);
   end loop;
   New_Line;
end Doubly_Linked_List_Container;
