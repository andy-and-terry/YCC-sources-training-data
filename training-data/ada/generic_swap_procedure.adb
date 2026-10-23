with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Swap_Procedure is
   generic
      type Item is private;
   procedure Swap (A, B : in out Item);

   procedure Swap (A, B : in out Item) is
      Temp : constant Item := A;
   begin
      A := B;
      B := Temp;
   end Swap;

   procedure Swap_Int is new Swap (Integer);
   procedure Swap_Char is new Swap (Character);

   X : Integer := 1;
   Y : Integer := 2;
   C : Character := 'a';
   D : Character := 'z';
begin
   Swap_Int (X, Y);
   Swap_Char (C, D);
   Put_Line (X'Image & Y'Image);
   Put_Line (C & D);
end Generic_Swap_Procedure;
