with Ada.Text_IO; use Ada.Text_IO;

procedure If_Expression_Demo is
   function Sign_Name (N : Integer) return String is
     (if N < 0 then "negative" elsif N = 0 then "zero" else "positive");

   function Max (A, B : Integer) return Integer is
     (if A > B then A else B);
begin
   Put_Line (Sign_Name (-5));
   Put_Line (Sign_Name (0));
   Put_Line (Sign_Name (12));
   Put_Line (Max (3, 9)'Image);
end If_Expression_Demo;
