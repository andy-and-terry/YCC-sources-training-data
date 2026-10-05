with Ada.Text_IO; use Ada.Text_IO;

procedure Generic_Swap is
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
   procedure Swap_Str is new Swap (String (1 .. 3));

   X : Integer := 1;
   Y : Integer := 2;
   S : String (1 .. 3) := "abc";
   T : String (1 .. 3) := "xyz";
begin
   Swap_Int (X, Y);
   Swap_Str (S, T);
   Put_Line (X'Image & Y'Image);
   Put_Line (S & " " & T);
end Generic_Swap;
