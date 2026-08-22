with Ada.Text_IO; use Ada.Text_IO;

procedure Is_Perfect_Number is
   function Is_Perfect (N : Positive) return Boolean is
      Sum : Natural := 0;
   begin
      for I in 1 .. N - 1 loop
         if N mod I = 0 then
            Sum := Sum + I;
         end if;
      end loop;
      return Sum = N;
   end Is_Perfect;
begin
   Put_Line (Is_Perfect (6)'Image);
   Put_Line (Is_Perfect (28)'Image);
   Put_Line (Is_Perfect (10)'Image);
end Is_Perfect_Number;
