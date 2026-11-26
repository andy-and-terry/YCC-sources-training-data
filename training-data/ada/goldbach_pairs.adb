--  Goldbach partitions of 100; expect 6.
with Ada.Text_IO; use Ada.Text_IO;

procedure Goldbach_Pairs is
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
   C : Integer := 0;
begin
   for P in 2 .. 50 loop
      if Is_Prime (P) and then Is_Prime (100 - P) then
         C := C + 1;
      end if;
   end loop;
   Put_Line (Integer'Image (C));
end Goldbach_Pairs;
