with Ada.Text_IO; use Ada.Text_IO;

procedure Circular_Buffer is
   Capacity : constant := 4;
   type Buffer_Array is array (0 .. Capacity - 1) of Integer;

   type Ring_Buffer is record
      Data  : Buffer_Array := (others => 0);
      Head  : Natural := 0;
      Count : Natural := 0;
   end record;

   procedure Push (Buf : in out Ring_Buffer; Value : Integer) is
      Tail : constant Natural := (Buf.Head + Buf.Count) mod Capacity;
   begin
      Buf.Data (Tail) := Value;
      if Buf.Count < Capacity then
         Buf.Count := Buf.Count + 1;
      else
         Buf.Head := (Buf.Head + 1) mod Capacity;
      end if;
   end Push;

   procedure Print (Buf : Ring_Buffer) is
   begin
      for I in 0 .. Buf.Count - 1 loop
         Put (Buf.Data ((Buf.Head + I) mod Capacity)'Image);
      end loop;
      New_Line;
   end Print;

   Buf : Ring_Buffer;
begin
   for V in 1 .. 6 loop
      Push (Buf, V);
   end loop;
   Print (Buf);
end Circular_Buffer;
