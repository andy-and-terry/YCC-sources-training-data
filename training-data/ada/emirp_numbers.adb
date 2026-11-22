with Ada.Text_IO; use Ada.Text_IO;
procedure Emirp_Numbers is
   --  Emirps: primes whose digit reversal is a different prime.
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

   function Reverse_Num (N : Natural) return Natural is
      M : Natural := N;
      R : Natural := 0;
   begin
      while M > 0 loop
         R := R * 10 + M mod 10;
         M := M / 10;
      end loop;
      return R;
   end Reverse_Num;
begin
   for N in 2 .. 199 loop
      declare
         R : constant Natural := Reverse_Num (N);
      begin
         if R /= N and then Is_Prime (N) and then Is_Prime (R) then
            Put (Integer'Image (N));
         end if;
      end;
   end loop;
   New_Line;
end Emirp_Numbers;
