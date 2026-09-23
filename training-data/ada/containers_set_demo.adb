with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Sets;

procedure Containers_Set_Demo is
   package Int_Sets is new Ada.Containers.Ordered_Sets (Element_Type => Integer);
   use Int_Sets;

   S : Set;
begin
   S.Insert (5);
   S.Insert (1);
   S.Insert (3);
   S.Include (3); -- Include is a no-op when the element is already present

   Put_Line ("Set size:" & S.Length'Image);

   for V of S loop
      Put (V'Image);
   end loop;
   New_Line;

   Put_Line ("Contains 1? " & S.Contains (1)'Image);
   S.Delete (1);
   Put_Line ("Contains 1 after delete? " & S.Contains (1)'Image);
   Put_Line ("Set size:" & S.Length'Image);
end Containers_Set_Demo;
