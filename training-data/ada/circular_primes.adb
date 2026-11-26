--  Circular primes below 100; expect 13.
with Ada.Text_IO; use Ada.Text_IO;

procedure Circular_Primes is
   function Is_Prime (N : Integer) return Boolean is
      D : Integer := 2;
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
   function Circular (N : Integer) return Boolean is
      Scale : Integer := 1;
      X     : Integer := N;
      Count : Integer := 1;
   begin
      while Scale * 10 <= N loop
         Scale := Scale * 10;
         Count := Count + 1;
      end loop;
      for I in 1 .. Count loop
         if not Is_Prime (X) then
            return False;
         end if;
         X := (X mod 10) * Scale + X / 10;
      end loop;
      return True;
   end Circular;
   C : Integer := 0;
begin
   for N in 2 .. 99 loop
      if Circular (N) then
         C := C + 1;
      end if;
   end loop;
   Put_Line (Integer'Image (C));
end Circular_Primes;
