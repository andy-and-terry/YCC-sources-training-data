with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Aggregates_Demo is
   type Grid is array (1 .. 3, 1 .. 3) of Integer;

   Identity : constant Grid :=
     (1 => (1 => 1, others => 0),
      2 => (2 => 1, others => 0),
      3 => (3 => 1, others => 0));

   V : constant array (1 .. 6) of Integer := (1 | 3 | 5 => 1, 2 | 4 => 2, others => 0);
   Z : constant array (1 .. 4) of Integer := (others => 7);
begin
   for I in Grid'Range (1) loop
      for J in Grid'Range (2) loop
         Put (Identity (I, J)'Image);
      end loop;
      New_Line;
   end loop;
   for X of V loop Put (X'Image); end loop;
   New_Line;
   for X of Z loop Put (X'Image); end loop;
   New_Line;
end Array_Aggregates_Demo;
