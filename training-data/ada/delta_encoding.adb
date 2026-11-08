with Ada.Text_IO; use Ada.Text_IO;
procedure Delta_Encoding is
   type Arr is array (1 .. 5) of Integer;
   Xs : constant Arr := (10, 12, 15, 15, 20);
   D  : Arr;
   Acc : Integer := 0;
begin
   D (1) := Xs (1);
   for I in 2 .. 5 loop
      D (I) := Xs (I) - Xs (I - 1);
   end loop;
   for V of D loop
      Put (Integer'Image (V));
   end loop;
   New_Line;
   for V of D loop
      Acc := Acc + V;
      Put (Integer'Image (Acc));
   end loop;
   New_Line;
end Delta_Encoding;
