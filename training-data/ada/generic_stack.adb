with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Stack is
   generic
      type Element_Type is private;
      Max_Size : Positive;
   package Stack_Pkg is
      procedure Push (Item : Element_Type);
      function Pop return Element_Type;
      function Is_Empty return Boolean;
   end Stack_Pkg;

   package body Stack_Pkg is
      Items : array (1 .. Max_Size) of Element_Type;
      Top   : Natural := 0;

      procedure Push (Item : Element_Type) is
      begin
         Top := Top + 1;
         Items (Top) := Item;
      end Push;

      function Pop return Element_Type is
      begin
         Top := Top - 1;
         return Items (Top + 1);
      end Pop;

      function Is_Empty return Boolean is
      begin
         return Top = 0;
      end Is_Empty;
   end Stack_Pkg;

   package Int_Stack is new Stack_Pkg (Integer, 10);
begin
   Int_Stack.Push (1);
   Int_Stack.Push (2);
   Int_Stack.Push (3);
   Put_Line (Int_Stack.Pop'Image);
   Put_Line (Int_Stack.Is_Empty'Image);
end Generic_Stack;
