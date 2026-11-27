with Ada.Text_IO; use Ada.Text_IO;

procedure Cuban_Primes is
   function Is_Prime (N : Long_Integer) return Boolean is
      I : Long_Integer := 2;
   begin
      if N < 2 then return False; end if;
      while I * I <= N loop
         if N mod I = 0 then return False; end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

   Found : Natural := 0;
   Y     : Long_Integer := 1;
begin
   while Found < 8 loop
      declare
         P : constant Long_Integer := 3 * Y * Y + 3 * Y + 1;
      begin
         if Is_Prime (P) then
            Put (Long_Integer'Image (P));
            Found := Found + 1;
         end if;
      end;
      Y := Y + 1;
   end loop;
   New_Line;
end Cuban_Primes;
