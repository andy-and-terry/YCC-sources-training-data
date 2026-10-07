with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Aggregate_Demo is
   type Grid is array (1 .. 3, 1 .. 3) of Integer;
   type Vec  is array (Positive range <>) of Integer;

   Identity : constant Grid :=
     ((1, 0, 0),
      (0, 1, 0),
      (0, 0, 1));

   Zeros  : constant Vec (1 .. 5) := (others => 0);
   Mixed  : constant Vec (1 .. 6) := (1 | 3 | 5 => 1, others => 2);
   Ranged : constant Vec (1 .. 6) := (1 .. 3 => 10, 4 .. 6 => 20);
begin
   for I in Grid'Range (1) loop
      for J in Grid'Range (2) loop
         Put (Identity (I, J)'Image);
      end loop;
      New_Line;
   end loop;

   for V of Zeros loop Put (V'Image); end loop;
   New_Line;
   for V of Mixed loop Put (V'Image); end loop;
   New_Line;
   for V of Ranged loop Put (V'Image); end loop;
   New_Line;
end Array_Aggregate_Demo;
