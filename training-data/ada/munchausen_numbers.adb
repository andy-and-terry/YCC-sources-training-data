with Ada.Text_IO; use Ada.Text_IO;
procedure Munchausen_Numbers is
   --  Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
   function Is_Munchausen (N : Positive) return Boolean is
      M, D, P, Total : Natural := 0;
   begin
      M := N;
      while M > 0 loop
         D := M mod 10;
         if D > 0 then
            P := 1;
            for I in 1 .. D loop
               P := P * D;
            end loop;
            Total := Total + P;
         end if;
         M := M / 10;
      end loop;
      return Total = N;
   end Is_Munchausen;
begin
   for N in 1 .. 4999 loop
      if Is_Munchausen (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Munchausen_Numbers;
