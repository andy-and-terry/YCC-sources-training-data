with Ada.Text_IO; use Ada.Text_IO;
procedure Generic_Swap_Y is
   generic
      type T is private;
   procedure Swap (A, B : in out T);
   procedure Swap (A, B : in out T) is
      Tmp : constant T := A;
   begin
      A := B; B := Tmp;
   end Swap;
   procedure Swap_Int is new Swap (Integer);
   X : Integer := 1; Y : Integer := 2;
begin
   Swap_Int (X, Y);
   Put_Line (Integer'Image (X) & Integer'Image (Y));
end Generic_Swap_Y;
