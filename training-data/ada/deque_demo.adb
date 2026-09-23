with Ada.Text_IO; use Ada.Text_IO;

procedure Deque_Demo is
   -- A double-ended queue backed by a fixed-size circular array: items
   -- can be pushed and popped from either end in O(1).
   Capacity : constant := 8;
   type Element_Array is array (0 .. Capacity - 1) of Integer;

   Items     : Element_Array := (others => 0);
   Front_Idx : Integer := 0;
   Back_Idx  : Integer := -1;
   Count     : Natural := 0;

   procedure Push_Back (Value : Integer) is
   begin
      Back_Idx := (Back_Idx + 1) mod Capacity;
      Items (Back_Idx) := Value;
      Count := Count + 1;
   end Push_Back;

   procedure Push_Front (Value : Integer) is
   begin
      Front_Idx := (Front_Idx - 1 + Capacity) mod Capacity;
      Items (Front_Idx) := Value;
      Count := Count + 1;
   end Push_Front;

   function Pop_Front return Integer is
      Value : constant Integer := Items (Front_Idx);
   begin
      Front_Idx := (Front_Idx + 1) mod Capacity;
      Count := Count - 1;
      return Value;
   end Pop_Front;

   function Pop_Back return Integer is
      Value : constant Integer := Items (Back_Idx);
   begin
      Back_Idx := (Back_Idx - 1 + Capacity) mod Capacity;
      Count := Count - 1;
      return Value;
   end Pop_Back;
begin
   Push_Back (1);
   Push_Back (2);
   Push_Front (0);
   Push_Back (3);
   -- Deque now holds, front to back: 0 1 2 3

   Put_Line ("Pop_Front:" & Pop_Front'Image);
   Put_Line ("Pop_Back:"  & Pop_Back'Image);
   Put_Line ("Pop_Front:" & Pop_Front'Image);
   Put_Line ("Remaining count:" & Count'Image);
end Deque_Demo;
