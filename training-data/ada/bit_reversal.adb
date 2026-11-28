with Ada.Text_IO; use Ada.Text_IO;

procedure Bit_Reversal is
   type Byte is mod 2 ** 8;

   function Reverse_Bits (V : Byte) return Byte is
      X : Byte := V;
      R : Byte := 0;
   begin
      for I in 1 .. 8 loop
         R := R * 2 + (X mod 2);
         X := X / 2;
      end loop;
      return R;
   end Reverse_Bits;

   Inputs : constant array (1 .. 4) of Byte := (1, 6, 13, 128);
begin
   for V of Inputs loop
      Put_Line (Byte'Image (V) & " ->" & Byte'Image (Reverse_Bits (V)));
   end loop;  --  128 96 176 1
end Bit_Reversal;
