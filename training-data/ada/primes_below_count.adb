with Ada.Text_IO; use Ada.Text_IO;

procedure Primes_Below_Count is
   N : constant := 100;
   Composite : array (2 .. N - 1) of Boolean := (others => False);
   Count : Natural := 0;
begin
   for I in Composite'Range loop
      if not Composite (I) then
         Count := Count + 1;
         for J in I .. (N - 1) / I loop
            if I * J <= N - 1 and then J >= I then
               Composite (I * J) := True;
            end if;
         end loop;
      end if;
   end loop;
   Put_Line (Natural'Image (Count));
end Primes_Below_Count;
