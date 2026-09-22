with Ada.Text_IO; use Ada.Text_IO;

procedure Sliding_Window_Maximum is
   type Int_Array is array (Positive range <>) of Integer;

   Data : constant Int_Array := (1, 3, -1, -3, 5, 3, 6, 7);
   K    : constant Positive := 3;

   Deque       : array (1 .. Data'Length) of Positive;
   Front       : Positive := 1;
   Back        : Natural := 0;
begin
   for I in Data'Range loop
      while Back >= Front and then Data (Deque (Back)) <= Data (I) loop
         Back := Back - 1;
      end loop;
      Back := Back + 1;
      Deque (Back) := I;

      if Deque (Front) <= I - K then
         Front := Front + 1;
      end if;

      if I >= K then
         Put_Line (Data (Deque (Front))'Image);
      end if;
   end loop;
end Sliding_Window_Maximum;
