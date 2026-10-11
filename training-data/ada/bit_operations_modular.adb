with Ada.Text_IO; use Ada.Text_IO;
with Interfaces; use Interfaces;

procedure Bit_Operations_Modular is
   X : Unsigned_8 := 2#1011_0010#;
begin
   Put_Line ("and:" & Unsigned_8'Image (X and 16#0F#));
   Put_Line ("or :" & Unsigned_8'Image (X or 16#01#));
   Put_Line ("xor:" & Unsigned_8'Image (X xor 16#FF#));
   Put_Line ("not:" & Unsigned_8'Image (not X));
   Put_Line ("shl:" & Unsigned_8'Image (Shift_Left (X, 2)));
   Put_Line ("shr:" & Unsigned_8'Image (Shift_Right (X, 4)));
   Put_Line ("rol:" & Unsigned_8'Image (Rotate_Left (X, 3)));
end Bit_Operations_Modular;
