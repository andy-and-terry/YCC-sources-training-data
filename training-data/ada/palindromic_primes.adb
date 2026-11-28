with Ada.Text_IO; use Ada.Text_IO;

procedure Palindromic_Primes is
   function Is_Prime (N : Natural) return Boolean is
      I : Natural := 2;
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

   function Is_Palindrome (N : Natural) return Boolean is
      M : Natural := N;
      R : Natural := 0;
   begin
      while M > 0 loop
         R := R * 10 + M mod 10;
         M := M / 10;
      end loop;
      return R = N;
   end Is_Palindrome;
begin
   for N in 2 .. 199 loop
      if Is_Palindrome (N) and then Is_Prime (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;  --  2 3 5 7 11 101 131 151 181 191
end Palindromic_Primes;
