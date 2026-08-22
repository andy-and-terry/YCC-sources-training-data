with Ada.Text_IO; use Ada.Text_IO;

procedure Queue is
   type Int_Queue is record
      Items : array (1 .. 100) of Integer;
      Head, Tail : Integer := 1;
   end record;

   procedure Enqueue (Q : in out Int_Queue; Value : Integer) is
   begin
      Q.Items (Q.Tail) := Value;
      Q.Tail := Q.Tail + 1;
   end Enqueue;

   function Dequeue (Q : in out Int_Queue) return Integer is
      Value : constant Integer := Q.Items (Q.Head);
   begin
      Q.Head := Q.Head + 1;
      return Value;
   end Dequeue;

   Q : Int_Queue;
begin
   Enqueue (Q, 1);
   Enqueue (Q, 2);
   Enqueue (Q, 3);
   Put_Line (Dequeue (Q)'Image);
   Put_Line (Dequeue (Q)'Image);
end Queue;
