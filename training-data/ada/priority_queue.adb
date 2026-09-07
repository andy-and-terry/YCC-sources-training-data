with Ada.Text_IO; use Ada.Text_IO;

procedure Priority_Queue is
   Max_Size : constant := 16;
   type Heap_Array is array (1 .. Max_Size) of Integer;
   Heap : Heap_Array;
   Size : Natural := 0;

   procedure Swap (I, J : Positive) is
      Temp : Integer;
   begin
      Temp := Heap (I);
      Heap (I) := Heap (J);
      Heap (J) := Temp;
   end Swap;

   procedure Push (Value : Integer) is
      Idx, Parent : Positive;
   begin
      Size := Size + 1;
      Heap (Size) := Value;
      Idx := Size;
      while Idx > 1 loop
         Parent := Idx / 2;
         exit when Heap (Parent) <= Heap (Idx);
         Swap (Parent, Idx);
         Idx := Parent;
      end loop;
   end Push;

   function Pop return Integer is
      Top : Integer;
      Idx, Left, Right, Smallest : Positive;
   begin
      Top := Heap (1);
      Heap (1) := Heap (Size);
      Size := Size - 1;
      Idx := 1;
      loop
         Left := Idx * 2;
         Right := Idx * 2 + 1;
         Smallest := Idx;
         if Left <= Size and then Heap (Left) < Heap (Smallest) then
            Smallest := Left;
         end if;
         if Right <= Size and then Heap (Right) < Heap (Smallest) then
            Smallest := Right;
         end if;
         exit when Smallest = Idx;
         Swap (Idx, Smallest);
         Idx := Smallest;
      end loop;
      return Top;
   end Pop;
begin
   Push (5);
   Push (2);
   Push (9);
   Push (1);
   Push (7);
   while Size > 0 loop
      Put_Line (Pop'Image);
   end loop;
end Priority_Queue;
