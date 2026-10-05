with Ada.Text_IO; use Ada.Text_IO;

procedure Towers_Of_Hanoi is
   Moves : Natural := 0;

   procedure Move (N : Natural; From, To, Via : Character) is
   begin
      if N = 0 then
         return;
      end if;
      Move (N - 1, From, Via, To);
      Moves := Moves + 1;
      Put_Line ("Move disk" & N'Image & " from " & From & " to " & To);
      Move (N - 1, Via, To, From);
   end Move;
begin
   Move (3, 'A', 'C', 'B');
   Put_Line ("Total moves:" & Moves'Image);
end Towers_Of_Hanoi;
