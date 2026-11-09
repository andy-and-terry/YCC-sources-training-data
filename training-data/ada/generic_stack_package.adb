with Ada.Text_IO; use Ada.Text_IO;
procedure Generic_Stack_Package is
   generic
      type Item is private;
      Size : Positive;
   package Stack is
      procedure Push (X : Item);
      function Pop return Item;
   end Stack;
   package body Stack is
      Data : array (1 .. Size) of Item;
      Top  : Natural := 0;
      procedure Push (X : Item) is
      begin
         Top := Top + 1;
         Data (Top) := X;
      end Push;
      function Pop return Item is
      begin
         Top := Top - 1;
         return Data (Top + 1);
      end Pop;
   end Stack;
   package Int_Stack is new Stack (Integer, 10);
begin
   Int_Stack.Push (7);
   Int_Stack.Push (9);
   Put_Line (Integer'Image (Int_Stack.Pop));
   Put_Line (Integer'Image (Int_Stack.Pop));
end Generic_Stack_Package;
