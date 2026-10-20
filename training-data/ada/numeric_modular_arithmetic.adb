with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Numeric_Modular_Arithmetic is
   type Byte is mod 256;
   type Hash is mod 2**32;
   function Fnv (S : String) return Hash is
      H : Hash := 2166136261;
   begin
      for C of S loop H := (H xor Hash (Character'Pos (C))) * 16777619; end loop;
      return H;
   end Fnv;
   B : Byte := 250;
begin
   B := B + 10;
   Put_Line (Byte'Image (B) & Byte'Image (not Byte'(5)) & Byte'Image (Byte'(12) and 10) & Byte'Image (Byte'(12) xor 10));
   Put_Line (Hash'Image (Fnv ("hello")));
   Put_Line (Integer'Image (7 / 2) & Integer'Image (-7 / 2) & Integer'Image (7 mod 3) & Integer'Image (-7 mod 3) & Integer'Image (-7 rem 3));
   Put_Line (Float'Image (Sqrt (2.0)) & Float'Image (2.0 ** 10) & Integer'Image (Integer'Value ("16") ** 2));
   Put_Line (Float'Image (Sin (0.0)) & Float'Image (Log (Ada.Numerics.e)) & Float'Image (Float'Truncation (-2.7)));
   Put_Line (Integer'Image (abs (-5)) & Integer'Image (Integer (Float'Rounding (3.5))));
end Numeric_Modular_Arithmetic;
