with Ada.Text_IO; use Ada.Text_IO;

procedure Prefix_Range_Sum is
   Values : constant array (1 .. 8) of Integer := (3, 1, 4, 1, 5, 9, 2, 6);
   Prefix : array (0 .. 8) of Integer := (others => 0);

   function Query (Lo, Hi : Natural) return Integer is
   begin
      return Prefix (Hi) - Prefix (Lo);
   end Query;
begin
   for I in Values'Range loop
      Prefix (I) := Prefix (I - 1) + Values (I);
   end loop;
   Put_Line (Integer'Image (Query (2, 5)));
end Prefix_Range_Sum;
