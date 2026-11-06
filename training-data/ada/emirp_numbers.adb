--  Emirps: primes whose digit reversal is a different prime.
with Ada.Text_IO; use Ada.Text_IO;

procedure Emirp_Numbers is
   function Is_Prime (N : Integer) return Boolean is
      I : Integer := 2;
   begin
      if N < 2 then
         return False;
      end if;
      while I * I <= N loop
         if N mod I = 0 then
            return False;
         end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

   function Reverse_Digits (N : Integer) return Integer is
      T : Integer := N;
      R : Integer := 0;
   begin
      while T > 0 loop
         R := R * 10 + T mod 10;
         T := T / 10;
      end loop;
      return R;
   end Reverse_Digits;
begin
   for N in 2 .. 99 loop
      declare
         R : constant Integer := Reverse_Digits (N);
      begin
         if R /= N and then Is_Prime (N) and then Is_Prime (R) then
            Put (Integer'Image (N) & " ");
         end if;
      end;
   end loop;
   New_Line;
end Emirp_Numbers;
