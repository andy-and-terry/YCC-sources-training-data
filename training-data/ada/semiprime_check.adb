with Ada.Text_IO; use Ada.Text_IO;

procedure Semiprime_Check is
   function Prime_Factor_Count (Value : Positive) return Natural is
      N     : Positive := Value;
      P     : Positive := 2;
      Count : Natural := 0;
   begin
      while P * P <= N loop
         while N mod P = 0 loop
            N := N / P;
            Count := Count + 1;
         end loop;
         P := P + 1;
      end loop;
      if N > 1 then
         Count := Count + 1;
      end if;
      return Count;
   end Prime_Factor_Count;
begin
   for N in 2 .. 29 loop
      if Prime_Factor_Count (N) = 2 then
         Put (Natural'Image (N));
      end if;
   end loop;
   New_Line;
end Semiprime_Check;
