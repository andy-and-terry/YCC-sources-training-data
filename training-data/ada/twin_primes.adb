with Ada.Text_IO; use Ada.Text_IO;

procedure Twin_Primes is
   N : constant := 50;
   Composite : array (0 .. N) of Boolean := (others => False);
begin
   for I in 2 .. 7 loop
      if not Composite (I) then
         for J in I .. N / I loop
            Composite (I * J) := True;
         end loop;
      end if;
   end loop;
   for P in 3 .. N - 2 loop
      if not Composite (P) and not Composite (P + 2) then
         Put_Line ("(" & Integer'Image (P) & "," & Integer'Image (P + 2) & ")");
      end if;
   end loop;
end Twin_Primes;
