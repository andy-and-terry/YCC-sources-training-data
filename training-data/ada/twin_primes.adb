with Ada.Text_IO; use Ada.Text_IO;

procedure Twin_Primes is
   Limit     : constant := 80;
   Composite : array (0 .. Limit) of Boolean := (others => False);
begin
   for I in 2 .. 8 loop
      if not Composite (I) then
         for J in I .. Limit / I loop
            Composite (I * J) := True;
         end loop;
      end if;
   end loop;
   for P in 3 .. Limit - 2 loop
      if not Composite (P) and then not Composite (P + 2) then
         Put ("(" & Integer'Image (P) & "," & Integer'Image (P + 2) & " )");
      end if;
   end loop;
   New_Line;  --  pairs (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
end Twin_Primes;
