with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Holders;

--  An Indefinite_Holder stores one value of an unconstrained type
--  (here String) so it can live in a record or be reassigned freely.
procedure Indefinite_Holder_Demo is
   package String_Holders is new Ada.Containers.Indefinite_Holders (String);
   use String_Holders;

   H : Holder;
begin
   Put_Line ("Empty at start: " & Boolean'Image (H.Is_Empty));

   H.Replace_Element ("short");
   Put_Line ("Holds: " & H.Element);

   --  Replace with a value of a different length
   H.Replace_Element ("a considerably longer string");
   Put_Line ("Holds: " & H.Element & " (length"
             & Integer'Image (H.Element'Length) & ")");

   declare
      Copy : Holder := H;   --  deep copy of the stored value
   begin
      H.Clear;
      Put_Line ("Original empty: " & Boolean'Image (H.Is_Empty));
      Put_Line ("Copy still has: " & Copy.Element);
   end;
end Indefinite_Holder_Demo;
