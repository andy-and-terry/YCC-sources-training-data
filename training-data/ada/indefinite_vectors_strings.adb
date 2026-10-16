with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Vectors;

procedure Indefinite_Vectors_Strings is
   package String_Vectors is new Ada.Containers.Indefinite_Vectors
     (Index_Type => Positive, Element_Type => String);
   use String_Vectors;

   V : Vector;
begin
   V.Append ("alpha");
   V.Append ("be");
   V.Append ("gamma-ray");
   for S of V loop
      Put_Line (S & " (" & S'Length'Image & ")");
   end loop;
   Put_Line (V.First_Element);
   Put_Line (V.Last_Element);
end Indefinite_Vectors_Strings;
