with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Package_Instantiation is
   generic
      type Item is private;
      Capacity : Positive;
   package Ring is
      procedure Push (X : Item);
      function Oldest return Item;
      function Count return Natural;
   end Ring;

   package body Ring is
      Buf  : array (0 .. Capacity - 1) of Item;
      Head : Natural := 0;
      N    : Natural := 0;

      procedure Push (X : Item) is
      begin
         Buf ((Head + N) mod Capacity) := X;
         if N < Capacity then
            N := N + 1;
         else
            Head := (Head + 1) mod Capacity;
         end if;
      end Push;

      function Oldest return Item is (Buf (Head));
      function Count return Natural is (N);
   end Ring;

   package Int_Ring is new Ring (Integer, 3);
begin
   for I in 1 .. 5 loop
      Int_Ring.Push (I * 10);
   end loop;
   Put_Line ("Count:" & Int_Ring.Count'Image);
   Put_Line ("Oldest:" & Int_Ring.Oldest'Image);
end Generic_Package_Instantiation;
