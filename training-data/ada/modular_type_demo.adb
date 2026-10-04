with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Type_Demo is
   type Byte is mod 256;
   B : Byte := 250;
begin
   for I in 1 .. 10 loop
      B := B + 1;
      Put (B'Image);
   end loop;
   New_Line;
   Put_Line ("0 - 1 =" & Byte'Image (Byte'(0) - 1));
end Modular_Type_Demo;
