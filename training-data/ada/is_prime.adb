with Ada.Text_IO; use Ada.Text_IO;

procedure Is_Prime is
   function Is_Prime_Number (N : Positive) return Boolean is
   begin
      if N < 2 then
         return False;
      end if;
      for I in 2 .. N - 1 loop
         exit when I * I > N;
         if N mod I = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Prime_Number;
begin
   for N in 2 .. 20 loop
      if Is_Prime_Number (N) then
         Put (N'Image);
      end if;
   end loop;
   New_Line;
end Is_Prime;
