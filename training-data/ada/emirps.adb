--  Emirps below 200; expect 15.
with Ada.Text_IO; use Ada.Text_IO;

procedure Emirps is
   function Is_Prime (N : Integer) return Boolean is
      D : Integer := 2;
   begin
      if N < 2 then
         return False;
      end if;
      while D * D <= N loop
         if N mod D = 0 then
            return False;
         end if;
         D := D + 1;
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
   C : Integer := 0;
begin
   for N in 2 .. 199 loop
      if Rev (N) /= N and then Is_Prime (N) and then Is_Prime (Rev (N)) then
         C := C + 1;
      end if;
   end loop;
   Put_Line (Integer'Image (C));
end Emirps;
