with Ada.Text_IO; use Ada.Text_IO;
procedure Fibbinary_Numbers is
   --  Fibbinary numbers: no two adjacent 1 bits (checked by scanning bits).
   function Is_Fibbinary (N_In : Natural) return Boolean is
      N    : Natural := N_In;
      Prev : Natural := 0;
   begin
      while N > 0 loop
         if N mod 2 = 1 and Prev = 1 then
            return False;
         end if;
         Prev := N mod 2;
         N := N / 2;
      end loop;
      return True;
   end Is_Fibbinary;
begin
   for I in 0 .. 49 loop
      if Is_Fibbinary (I) then
         Put (Integer'Image (I));
      end if;
   end loop;
   New_Line;
end Fibbinary_Numbers;
