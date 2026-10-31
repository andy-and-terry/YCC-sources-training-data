with Ada.Text_IO; use Ada.Text_IO;

procedure Powerful_Numbers is
   function Is_Powerful (Value : Positive) return Boolean is
      N : Positive := Value;
      P : Positive := 2;
   begin
      while P * P <= N loop
         if N mod P = 0 then
            if N mod (P * P) /= 0 then
               return False;
            end if;
            while N mod P = 0 loop
               N := N / P;
            end loop;
         end if;
         P := P + 1;
      end loop;
      return N = 1;
   end Is_Powerful;
begin
   for N in 1 .. 100 loop
      if Is_Powerful (N) then
         Put (Natural'Image (N));
      end if;
   end loop;
   New_Line;
end Powerful_Numbers;
