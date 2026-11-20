with Ada.Text_IO; use Ada.Text_IO;
--  Goldbach pair.
procedure Goldbach_Pair is
   function Is_Prime (N : Integer) return Boolean is
      D : Integer := 2;
   begin
      if N < 2 then return False; end if;
      while D * D <= N loop
         if N mod D = 0 then return False; end if;
         D := D + 1;
      end loop;
      return True;
   end Is_Prime;
   N : constant Integer := 28;
begin
   for P in 2 .. N / 2 loop
      if Is_Prime (P) and then Is_Prime (N - P) then
         Put_Line (Integer'Image (P) & " +" & Integer'Image (N - P));
         exit;
      end if;
   end loop;
end Goldbach_Pair;
