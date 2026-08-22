with Ada.Text_IO; use Ada.Text_IO;

procedure Stack is
   type Int_Stack is record
      Items : array (1 .. 100) of Integer;
      Top   : Integer := 0;
   end record;

   procedure Push (S : in out Int_Stack; Value : Integer) is
   begin
      S.Top := S.Top + 1;
      S.Items (S.Top) := Value;
   end Push;

   function Pop (S : in out Int_Stack) return Integer is
      Value : constant Integer := S.Items (S.Top);
   begin
      S.Top := S.Top - 1;
      return Value;
   end Pop;

   S : Int_Stack;
begin
   Push (S, 1);
   Push (S, 2);
   Push (S, 3);
   Put_Line (Pop (S)'Image);
end Stack;
