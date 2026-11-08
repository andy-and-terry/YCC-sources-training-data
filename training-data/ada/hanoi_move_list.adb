with Ada.Text_IO; use Ada.Text_IO;
procedure Hanoi_Move_List is
   Count : Natural := 0;
   procedure Move (N : Natural; A, B, C : Character) is
   begin
      if N = 0 then
         return;
      end if;
      Move (N - 1, A, C, B);
      Put (A & "->" & C & " ");
      Count := Count + 1;
      Move (N - 1, B, A, C);
   end Move;
begin
   Move (3, 'A', 'B', 'C');
   New_Line;
   Put_Line (Natural'Image (Count) & " moves");
end Hanoi_Move_List;
