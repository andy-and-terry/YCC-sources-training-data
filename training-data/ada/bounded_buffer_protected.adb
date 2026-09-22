with Ada.Text_IO; use Ada.Text_IO;

procedure Bounded_Buffer_Protected is
   protected type Bounded_Buffer (Capacity : Positive) is
      entry Put (Item : Integer);
      entry Get (Item : out Integer);
   private
      Items : array (1 .. Capacity) of Integer;
      Count : Natural := 0;
      Head  : Positive := 1;
      Tail  : Positive := 1;
   end Bounded_Buffer;

   protected body Bounded_Buffer is
      entry Put (Item : Integer) when Count < Capacity is
      begin
         Items (Tail) := Item;
         Tail := (Tail mod Capacity) + 1;
         Count := Count + 1;
      end Put;

      entry Get (Item : out Integer) when Count > 0 is
      begin
         Item := Items (Head);
         Head := (Head mod Capacity) + 1;
         Count := Count - 1;
      end Get;
   end Bounded_Buffer;

   Buffer : Bounded_Buffer (Capacity => 3);
   Value  : Integer;
begin
   Buffer.Put (10);
   Buffer.Put (20);
   Buffer.Put (30);

   Buffer.Get (Value);
   Put_Line (Value'Image);
   Buffer.Get (Value);
   Put_Line (Value'Image);

   Buffer.Put (40);
   Buffer.Get (Value);
   Put_Line (Value'Image);
   Buffer.Get (Value);
   Put_Line (Value'Image);
end Bounded_Buffer_Protected;
