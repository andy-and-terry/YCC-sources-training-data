with Ada.Text_IO; use Ada.Text_IO;

procedure Sphenic_Numbers is
   function Is_Sphenic (Value : Positive) return Boolean is
      N        : Positive := Value;
      P        : Positive := 2;
      Distinct : Natural := 0;
   begin
      while P * P <= N loop
         if N mod P = 0 then
            N := N / P;
            if N mod P = 0 then
               return False;
            end if;
            Distinct := Distinct + 1;
         end if;
         P := P + 1;
      end loop;
      if N > 1 then
         Distinct := Distinct + 1;
      end if;
      return Distinct = 3;
   end Is_Sphenic;
begin
   for N in 2 .. 79 loop
      if Is_Sphenic (N) then
         Put (Natural'Image (N));
      end if;
   end loop;
   New_Line;
end Sphenic_Numbers;
