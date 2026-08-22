with Ada.Text_IO; use Ada.Text_IO;

procedure Sieve_Of_Eratosthenes is
   Limit : constant Integer := 50;
   Is_Prime : array (0 .. Limit) of Boolean := (others => True);
begin
   Is_Prime (0) := False;
   Is_Prime (1) := False;
   for N in 2 .. Limit loop
      if Is_Prime (N) then
         declare
            Multiple : Integer := N * N;
         begin
            while Multiple <= Limit loop
               Is_Prime (Multiple) := False;
               Multiple := Multiple + N;
            end loop;
         end;
      end if;
   end loop;
   for N in 0 .. Limit loop
      if Is_Prime (N) then
         Put (N'Image);
      end if;
   end loop;
   New_Line;
end Sieve_Of_Eratosthenes;
