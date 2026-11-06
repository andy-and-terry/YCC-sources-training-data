--  Fermat primality test; Carmichael number 561 fools it.
with Ada.Text_IO; use Ada.Text_IO;

procedure Fermat_Primality is
   type U64 is mod 2 ** 64;

   function Pow_Mod (B0, E0, M : U64) return U64 is
      B : U64 := B0 mod M;
      E : U64 := E0;
      R : U64 := 1;
   begin
      while E > 0 loop
         if E mod 2 = 1 then
            R := R * B mod M;
         end if;
         B := B * B mod M;
         E := E / 2;
      end loop;
      return R;
   end Pow_Mod;

   function Probably_Prime (N : U64) return Boolean is
     (N > 2 and then Pow_Mod (2, N - 1, N) = 1);

   Tests : constant array (1 .. 3) of U64 := (97, 91, 561);
begin
   for T of Tests loop
      Put_Line (U64'Image (T) & " " & Boolean'Image (Probably_Prime (T)));
   end loop;
end Fermat_Primality;
