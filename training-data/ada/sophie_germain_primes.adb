with Ada.Text_IO; use Ada.Text_IO;
procedure Sophie_Germain_Primes is
   --  Sophie Germain primes: p prime and 2p + 1 prime.
   function Is_Prime (N : Natural) return Boolean is
      D : Natural := 2;
   begin
      if N < 2 then
         return False;
      end if;
      while D * D <= N loop
         if N mod D = 0 then
            return False;
         end if;
         D := D + 1;
      end loop;
      return True;
   end Is_Prime;
begin
   for P in 2 .. 99 loop
      if Is_Prime (P) and then Is_Prime (2 * P + 1) then
         Put (Integer'Image (P));
      end if;
   end loop;
   New_Line;
end Sophie_Germain_Primes;
