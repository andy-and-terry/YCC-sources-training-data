with Ada.Text_IO; use Ada.Text_IO;

procedure Fenwick_Tree is
   N    : constant Integer := 8;
   Tree : array (0 .. N) of Integer := (others => 0);

   function Low_Bit (I : Integer) return Integer is
   begin
      -- isolate the lowest set bit of I without a bitwise operator
      if I mod 2 = 1 then
         return 1;
      else
         return 2 * Low_Bit (I / 2);
      end if;
   end Low_Bit;

   procedure Update (Index, Delta : Integer) is
      I : Integer := Index;
   begin
      while I <= N loop
         Tree (I) := Tree (I) + Delta;
         I := I + Low_Bit (I);
      end loop;
   end Update;

   function Prefix_Sum (Index : Integer) return Integer is
      I     : Integer := Index;
      Total : Integer := 0;
   begin
      while I > 0 loop
         Total := Total + Tree (I);
         I := I - Low_Bit (I);
      end loop;
      return Total;
   end Prefix_Sum;

   function Range_Sum (Left, Right : Integer) return Integer is
   begin
      if Left > 1 then
         return Prefix_Sum (Right) - Prefix_Sum (Left - 1);
      else
         return Prefix_Sum (Right);
      end if;
   end Range_Sum;

   Values : constant array (1 .. N) of Integer := (3, 2, -1, 6, 5, 4, -3, 3);
begin
   for I in Values'Range loop
      Update (I, Values (I));
   end loop;
   Put_Line (Prefix_Sum (5)'Image);
   Put_Line (Range_Sum (3, 7)'Image);
end Fenwick_Tree;
