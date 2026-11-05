with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Swap_Package is
   generic
      type T is private;
   procedure Swap (A, B : in out T);

   procedure Swap (A, B : in out T) is
      Tmp : constant T := A;
   begin
      A := B;
      B := Tmp;
   end Swap;

   procedure Swap_Int is new Swap (Integer);
   procedure Swap_Str is new Swap (Character);

   X : Integer := 1;
   Y : Integer := 2;
   C : Character := 'a';
   D : Character := 'z';
begin
   Swap_Int (X, Y);
   Swap_Str (C, D);
   Put_Line (Integer'Image (X) & Integer'Image (Y) & " " & C & D);
end Generic_Swap_Package;
