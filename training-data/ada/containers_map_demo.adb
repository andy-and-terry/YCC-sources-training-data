with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Maps;

procedure Containers_Map_Demo is
   package Int_Maps is new Ada.Containers.Ordered_Maps
     (Key_Type => Integer, Element_Type => Integer);
   use Int_Maps;

   M : Map;
begin
   M.Insert (3, 30);
   M.Insert (1, 10);
   M.Insert (2, 20);

   Put_Line ("Number of entries:" & M.Length'Image);

   -- Ordered_Maps.Iterate yields keys in ascending order.
   for C in M.Iterate loop
      Put_Line ("Key" & Key (C)'Image & " -> " & Element (C)'Image);
   end loop;

   if M.Contains (2) then
      Put_Line ("Contains key 2, value =" & Element (M, 2)'Image);
   end if;

   M.Delete (1);
   Put_Line ("Number of entries after delete:" & M.Length'Image);
end Containers_Map_Demo;
