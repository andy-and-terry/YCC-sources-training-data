with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Types_Demo is
   type Byte is mod 256;
   type Hash is mod 2**32;

   B : Byte := 250;
   H : Hash := 16#FFFF_FFFF#;
begin
   B := B + 10;                     --  wraps around to 4
   Put_Line ("Byte after wrap:" & B'Image);
   H := H + 2;                      --  wraps to 1
   Put_Line ("Hash after wrap:" & H'Image);
   Put_Line ("Bitwise and:" & Byte'Image (12 and 10));
   Put_Line ("Bitwise or: " & Byte'Image (12 or 10));
   Put_Line ("Bitwise xor:" & Byte'Image (12 xor 10));
   Put_Line ("Not 0:      " & Byte'Image (not 0));
end Modular_Types_Demo;
