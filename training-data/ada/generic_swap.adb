with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Swap is
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
   procedure Swap_Str is new Swap (Character);
   X : Integer := 1;
   Y : Integer := 2;
   C1 : Character := 'a';
   C2 : Character := 'z';
begin
   Swap_Int (X, Y);
   Swap_Str (C1, C2);
   Put_Line (X'Image & Y'Image);
   Put_Line (C1 & C2);
end Generic_Swap;
