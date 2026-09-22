with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;

procedure Containers_Vector_Demo is
   package Integer_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Integer);
   use Integer_Vectors;

   V   : Vector;
   Sum : Integer := 0;
begin
   V.Append (10);
   V.Append (20);
   V.Append (30);
   V.Insert (1, 15);

   for Item of V loop
      Sum := Sum + Item;
   end loop;

   Put_Line ("Length:" & V.Length'Image);
   Put_Line ("Sum:" & Sum'Image);
   Put_Line ("First:" & V.First_Element'Image);
   Put_Line ("Last:" & V.Last_Element'Image);

   V.Delete_First;
   Put_Line ("First after delete:" & V.First_Element'Image);
end Containers_Vector_Demo;
