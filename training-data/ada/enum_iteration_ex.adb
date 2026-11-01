with Ada.Text_IO; use Ada.Text_IO;

procedure Enum_Iteration_Ex is
   type Day is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
   subtype Weekend is Day range Sat .. Sun;
begin
   for D in Day loop
      Put (Day'Image (D) & (if D in Weekend then "*" else "") & " ");
   end loop;
   New_Line;
   Put_Line (Day'Image (Day'Succ (Mon)) & Day'Image (Day'Pred (Sun)));
end Enum_Iteration_Ex;
