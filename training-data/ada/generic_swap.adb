with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Swap is
   generic
      type Element is private;
   procedure Swap (X, Y : in out Element);

   procedure Swap (X, Y : in out Element) is
      Tmp : constant Element := X;
   begin
      X := Y;
      Y := Tmp;
   end Swap;

   procedure Swap_Int is new Swap (Integer);
   procedure Swap_Bool is new Swap (Boolean);

   A : Integer := 1;
   B : Integer := 2;
   P : Boolean := True;
   Q : Boolean := False;
begin
   Swap_Int (A, B);
   Swap_Bool (P, Q);
   Put_Line ("A =" & A'Image & ", B =" & B'Image);
   Put_Line ("P = " & P'Image & ", Q = " & Q'Image);
end Generic_Swap;
