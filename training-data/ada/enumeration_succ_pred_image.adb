with Ada.Text_IO; use Ada.Text_IO;

procedure Enumeration_Succ_Pred_Image is
   type Day is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
   D : Day := Wed;
begin
   Put_Line (Day'Image (Day'Succ (D)));
   Put_Line (Day'Image (Day'Pred (D)));
   Put_Line (Integer'Image (Day'Pos (Sun)));
   Put_Line (Day'Image (Day'Value ("FRI")));
   for X in Day range Sat .. Sun loop
      Put (Day'Image (X) & " ");
   end loop;
   New_Line;
end Enumeration_Succ_Pred_Image;
