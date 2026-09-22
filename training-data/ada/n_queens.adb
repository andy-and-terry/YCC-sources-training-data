with Ada.Text_IO; use Ada.Text_IO;

procedure N_Queens is
   Board_Size : constant := 8;
   type Column_Array is array (0 .. Board_Size - 1) of Integer;

   Columns          : Column_Array;
   Solution_Count   : Natural := 0;
   First_Solution   : Column_Array;
   Found_First      : Boolean := False;

   function Is_Safe (Row, Col : Integer) return Boolean is
   begin
      for Prev_Row in 0 .. Row - 1 loop
         if Columns (Prev_Row) = Col
           or else abs (Columns (Prev_Row) - Col) = abs (Prev_Row - Row)
         then
            return False;
         end if;
      end loop;
      return True;
   end Is_Safe;

   procedure Solve (Row : Integer) is
   begin
      if Row = Board_Size then
         Solution_Count := Solution_Count + 1;
         if not Found_First then
            First_Solution := Columns;
            Found_First := True;
         end if;
         return;
      end if;

      for Col in 0 .. Board_Size - 1 loop
         if Is_Safe (Row, Col) then
            Columns (Row) := Col;
            Solve (Row + 1);
         end if;
      end loop;
   end Solve;
begin
   Solve (0);
   Put_Line ("Solutions for" & Board_Size'Image & "-queens:" & Solution_Count'Image);
   Put ("First solution (column per row):");
   for C of First_Solution loop
      Put (C'Image);
   end loop;
   New_Line;
end N_Queens;
