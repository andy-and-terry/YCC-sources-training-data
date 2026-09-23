with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Exponentiation is
   -- Fast (binary) modular exponentiation: computes Base**Exponent mod
   -- Modulus in O(log Exponent) multiplications, without ever forming
   -- the (potentially huge) unreduced power.
   function Power_Mod
     (Base, Exponent, Modulus : Long_Long_Integer) return Long_Long_Integer
   is
      Result : Long_Long_Integer := 1;
      B      : Long_Long_Integer := Base mod Modulus;
      E      : Long_Long_Integer := Exponent;
   begin
      while E > 0 loop
         if E mod 2 = 1 then
            Result := (Result * B) mod Modulus;
         end if;
         E := E / 2;
         B := (B * B) mod Modulus;
      end loop;
      return Result;
   end Power_Mod;
begin
   Put_Line ("3^13 mod 7   =" & Power_Mod (3, 13, 7)'Image);
   Put_Line ("7^560 mod 561=" & Power_Mod (7, 560, 561)'Image);
   Put_Line ("2^10 mod 1000=" & Power_Mod (2, 10, 1000)'Image);
end Modular_Exponentiation;
