with Ada.Text_IO; use Ada.Text_IO;

procedure Modular_Exponentiation is
   function Mod_Pow (Base, Exponent, Modulus : Long_Long_Integer) return Long_Long_Integer is
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
   end Mod_Pow;
begin
   Put_Line (Mod_Pow (2, 10, 1000)'Image);
   Put_Line (Mod_Pow (7, 128, 13)'Image);
end Modular_Exponentiation;
