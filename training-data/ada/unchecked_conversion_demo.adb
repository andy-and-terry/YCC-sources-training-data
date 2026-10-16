with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces; use Interfaces;

procedure Unchecked_Conversion_Demo is
   function To_Bits is new Ada.Unchecked_Conversion (Float, Unsigned_32);
   function To_Float is new Ada.Unchecked_Conversion (Unsigned_32, Float);

   Bits : constant Unsigned_32 := To_Bits (1.0);
begin
   Put_Line (Bits'Image);
   Put_Line (To_Float (Bits)'Image);
   Put_Line (To_Float (16#40000000#)'Image);
end Unchecked_Conversion_Demo;
