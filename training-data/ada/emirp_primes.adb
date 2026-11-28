with Ada.Text_IO; use Ada.Text_IO;

procedure Emirp_Primes is
   function Is_Prime (N : Integer) return Boolean is
   begin
      if N < 2 then return False; end if;
      for I in 2 .. N - 1 loop
         exit when I * I > N;
         if N mod I = 0 then return False; end if;
      end loop;
      return True;
   end Is_Prime;

   function Rev (N : Integer) return Integer is
      M : Integer := N;
      R : Integer := 0;
   begin
      while M > 0 loop
         R := R * 10 + M mod 10;
         M := M / 10;
      end loop;
      return R;
   end Rev;
begin
   for P in 2 .. 99 loop
      if Is_Prime (P) and then Rev (P) /= P and then Is_Prime (Rev (P)) then
         Put (Integer'Image (P));
      end if;
   end loop;
   New_Line;
end Emirp_Primes;
