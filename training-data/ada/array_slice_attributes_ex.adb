with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Slice_Attributes_Ex is
   A : array (1 .. 8) of Integer := (1, 2, 3, 4, 5, 6, 7, 8);
   Sum : Integer := 0;
begin
   for I in A'First + 2 .. A'Last - 2 loop
      Sum := Sum + A (I);
   end loop;
   Put_Line (Integer'Image (Sum));
end Array_Slice_Attributes_Ex;
