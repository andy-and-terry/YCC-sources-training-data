with Ada.Text_IO; use Ada.Text_IO;
procedure Carmichael_Numbers is
   --  Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
   type Big is range 0 .. 2 ** 62;

   function GCD (A, B : Big) return Big is
   begin
      if B = 0 then return A; else return GCD (B, A mod B); end if;
   end GCD;

   function Pow_Mod (B0 : Big; E0 : Big; M : Big) return Big is
      B : Big := B0 mod M;
      E : Big := E0;
      R : Big := 1;
   begin
      while E > 0 loop
         if E mod 2 = 1 then R := R * B mod M; end if;
         B := B * B mod M;
         E := E / 2;
      end loop;
      return R;
   end Pow_Mod;

   function Is_Prime (N : Big) return Boolean is
      P : Big := 2;
   begin
      if N < 2 then return False; end if;
      while P * P <= N loop
         if N mod P = 0 then return False; end if;
         P := P + 1;
      end loop;
      return True;
   end Is_Prime;

   function Is_Carmichael (N : Big) return Boolean is
   begin
      if Is_Prime (N) then return False; end if;
      for A in 2 .. N - 1 loop
         if GCD (A, N) = 1 and then Pow_Mod (A, N - 1, N) /= 1 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Carmichael;

   N : Big := 3;
begin
   while N < 3000 loop
      if Is_Carmichael (N) then
         Put (Big'Image (N));
      end if;
      N := N + 2;
   end loop;
   New_Line;
end Carmichael_Numbers;
