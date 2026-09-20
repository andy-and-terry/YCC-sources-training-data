with Ada.Text_IO; use Ada.Text_IO;

procedure Next_Greater_Element is
   type Int_Array is array (Positive range <>) of Integer;

   Data   : constant Int_Array := (4, 5, 2, 25, 7, 8);
   Result : array (Data'Range) of Integer := (others => -1);

   -- Monotonic decreasing stack of indices into Data.
   Stack : array (1 .. Data'Length) of Positive;
   Top   : Natural := 0;
begin
   for I in Data'Range loop
      while Top > 0 and then Data (Stack (Top)) < Data (I) loop
         Result (Stack (Top)) := Data (I);
         Top := Top - 1;
      end loop;
      Top := Top + 1;
      Stack (Top) := I;
   end loop;

   for I in Data'Range loop
      Put_Line (Data (I)'Image & " -> " & Result (I)'Image);
   end loop;
end Next_Greater_Element;
