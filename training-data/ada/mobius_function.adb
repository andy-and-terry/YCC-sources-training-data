with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Mobius_Function is
   --  Moebius function: 0 if n has a squared prime factor, else (-1)^k.
   function Mobius (N_In : Positive) return Integer is
      N      : Natural := N_In;
      P      : Natural := 2;
      Result : Integer := 1;
   begin
      while P * P <= N loop
         if N mod P = 0 then
            N := N / P;
            if N mod P = 0 then
               return 0;
            end if;
            Result := -Result;
         end if;
         P := P + 1;
      end loop;
      if N > 1 then
         Result := -Result;
      end if;
      return Result;
   end Mobius;
begin
   for I in 1 .. 30 loop
      Put (Mobius (I), Width => 3);
   end loop;
   New_Line;
end Mobius_Function;
