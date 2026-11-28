with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Type_Wrap is
   type Byte is mod 256;
   B : Byte := 250;
begin
   for I in 1 .. 10 loop
      B := B + 1;
   end loop;
   Put_Line (Byte'Image (B));
end Modular_Type_Wrap;
