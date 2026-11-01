with Ada.Text_IO; use Ada.Text_IO;

--  Pernicious numbers: the popcount is prime.
procedure Pernicious_Numbers is
   function Is_Prime (N : Natural) return Boolean is
   begin
      if N < 2 then
         return False;
      end if;
      for D in 2 .. N - 1 loop
         exit when D * D > N;
         if N mod D = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Prime;

   function Popcount (N : Natural) return Natural is
      M : Natural := N;
      C : Natural := 0;
   begin
      while M > 0 loop
         C := C + M mod 2;
         M := M / 2;
      end loop;
      return C;
   end Popcount;
begin
   for N in 1 .. 20 loop
      if Is_Prime (Popcount (N)) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Pernicious_Numbers;
