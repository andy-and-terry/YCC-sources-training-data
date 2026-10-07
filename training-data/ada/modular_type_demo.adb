with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Type_Demo is
   type Byte is mod 256;
   type Hour is mod 24;

   B : Byte := 250;
   H : Hour := 22;
begin
   B := B + 10;
   H := H + 5;
   Put_Line ("Byte wraps to" & Byte'Image (B));
   Put_Line ("Hour wraps to" & Hour'Image (H));
   Put_Line ("not B =" & Byte'Image (not B));
   Put_Line ("B and 16#0F# =" & Byte'Image (B and 16#0F#));
end Modular_Type_Demo;
