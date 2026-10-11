with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Float_Text_IO_Demo is
   X : constant Float := 3.14159;
begin
   Put (X, Fore => 2, Aft => 2, Exp => 0);
   New_Line;
   Put (X, Fore => 1, Aft => 4, Exp => 0);
   New_Line;
   Put (12345.678, Fore => 1, Aft => 2, Exp => 3);
   New_Line;
end Float_Text_IO_Demo;
