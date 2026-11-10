with Ada.Text_IO; use Ada.Text_IO;

procedure Sophie_Germain_Primes is
   function Is_Prime (N : Natural) return Boolean is
      I : Natural := 2;
   begin
      if N < 2 then return False; end if;
      while I * I <= N loop
         if N mod I = 0 then return False; end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

   Count : Natural := 0;
   P     : Natural := 2;
begin
   while Count < 10 loop
      if Is_Prime (P) and then Is_Prime (2 * P + 1) then
         Put (Natural'Image (P));
         Count := Count + 1;
      end if;
      P := P + 1;
   end loop;
   New_Line;  --  2 3 5 11 23 29 41 53 83 89
end Sophie_Germain_Primes;
