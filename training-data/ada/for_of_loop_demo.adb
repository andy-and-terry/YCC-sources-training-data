with Ada.Text_IO; use Ada.Text_IO;

procedure For_Of_Loop_Demo is
   type Int_Array is array (Positive range <>) of Integer;
   Data : Int_Array := (4, 8, 15, 16, 23, 42);
   Total : Integer := 0;
begin
   for Item of Data loop
      Total := Total + Item;
   end loop;
   Put_Line ("Total:" & Total'Image);

   for Item of reverse Data loop
      Put (Item'Image);
   end loop;
   New_Line;

   for Item of Data loop
      Item := Item * 2;
   end loop;
   Put_Line (Data (Data'Last)'Image);
end For_Of_Loop_Demo;
