with Ada.Text_IO; use Ada.Text_IO;

procedure Swap_Generic is
   generic
      type Item is private;
   procedure Swap (A, B : in out Item);

   procedure Swap (A, B : in out Item) is
      T : constant Item := A;
   begin
      A := B;
      B := T;
   end Swap;

   procedure Swap_Int is new Swap (Integer);
   procedure Swap_Char is new Swap (Character);

   X : Integer := 12;
   Y : Integer := 34;
   C : Character := 'a';
   D : Character := 'z';
begin
   Swap_Int (X, Y);
   Swap_Char (C, D);
   Put_Line (Integer'Image (X) & Integer'Image (Y) & " " & C & D);
end Swap_Generic;
