with Ada.Text_IO; use Ada.Text_IO;

procedure Contract_Demo is
   function Isqrt (X : Natural) return Natural
     with Post => Isqrt'Result * Isqrt'Result <= X
                  and then (Isqrt'Result + 1) * (Isqrt'Result + 1) > X;

   function Isqrt (X : Natural) return Natural is
      R : Natural := 0;
   begin
      while (R + 1) * (R + 1) <= X loop
         R := R + 1;
      end loop;
      return R;
   end Isqrt;

   function Factorial (N : Natural) return Positive
     with Pre  => N <= 12,
          Post => Factorial'Result >= 1;

   function Factorial (N : Natural) return Positive is
   begin
      if N = 0 then
         return 1;
      else
         return N * Factorial (N - 1);
      end if;
   end Factorial;
begin
   Put_Line (Isqrt (50)'Image);
   Put_Line (Isqrt (16)'Image);
   Put_Line (Factorial (5)'Image);
end Contract_Demo;
