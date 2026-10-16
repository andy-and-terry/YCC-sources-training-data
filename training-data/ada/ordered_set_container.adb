with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Sets;

procedure Ordered_Set_Container is
   package Int_Sets is new Ada.Containers.Ordered_Sets (Integer);
   use Int_Sets;

   S : Set;
begin
   S.Include (5);
   S.Include (1);
   S.Include (9);
   S.Include (1);
   S.Include (5);
   S.Include (3);
   Put_Line ("Size:" & S.Length'Image);
   for X of S loop
      Put (X'Image);
   end loop;
   New_Line;
   Put_Line ("Has 9: " & Boolean'Image (S.Contains (9)));
   Put_Line ("Min:" & S.First_Element'Image);
end Ordered_Set_Container;
