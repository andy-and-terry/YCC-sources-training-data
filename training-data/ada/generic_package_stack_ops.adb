with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Package_Stack_Ops is
   generic
      type Element is private;
      Capacity : Positive := 10;
   package Bounded_Stack is
      procedure Push (X : Element);
      function Pop return Element;
      function Size return Natural;
      Overflow, Underflow : exception;
   end Bounded_Stack;

   package body Bounded_Stack is
      Items : array (1 .. Capacity) of Element;
      Top : Natural := 0;
      procedure Push (X : Element) is
      begin
         if Top = Capacity then raise Overflow; end if;
         Top := Top + 1; Items (Top) := X;
      end Push;
      function Pop return Element is
      begin
         if Top = 0 then raise Underflow; end if;
         Top := Top - 1; return Items (Top + 1);
      end Pop;
      function Size return Natural is (Top);
   end Bounded_Stack;

   package Int_Stack is new Bounded_Stack (Integer, 2);
begin
   Int_Stack.Push (1); Int_Stack.Push (2);
   Put_Line (Integer'Image (Int_Stack.Pop) & Natural'Image (Int_Stack.Size));
   Int_Stack.Push (3);
   Int_Stack.Push (4);
exception
   when Int_Stack.Overflow => Put_Line ("overflow caught");
end Generic_Package_Stack_Ops;
