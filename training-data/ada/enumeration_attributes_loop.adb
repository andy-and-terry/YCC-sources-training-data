with Ada.Text_IO; use Ada.Text_IO;

procedure Enum_Demo is
   type Day is (Mon, Tue, Wed, Thu, Fri);
begin
   for D in Day loop
      Put_Line (Day'Image (D) & Integer'Image (Day'Pos (D)));
   end loop;
   Put_Line (Day'Image (Day'Succ (Mon)));
end Enum_Demo;
