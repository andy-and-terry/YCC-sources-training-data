with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;

procedure Vector_Generic_Sorting is
   package Int_Vectors is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => Integer);
   package Int_Sorting is new Int_Vectors.Generic_Sorting;

   V : Int_Vectors.Vector;
begin
   for X of reverse (1 .. 5) loop
      V.Append (X * 7 mod 11);
   end loop;

   Int_Sorting.Sort (V);
   for X of V loop
      Put (X'Image);
   end loop;
   New_Line;
end Vector_Generic_Sorting;
