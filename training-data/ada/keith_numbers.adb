with Ada.Text_IO; use Ada.Text_IO;
procedure Keith_Numbers is
   --  Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
   function Is_Keith (N : Positive) return Boolean is
      Seq : array (1 .. 64) of Natural;
      Tmp : array (1 .. 10) of Natural;
      K, Len, M, Total : Natural := 0;
   begin
      M := N;
      while M > 0 loop
         K := K + 1;
         Tmp (K) := M mod 10;
         M := M / 10;
      end loop;
      for I in 1 .. K loop
         Seq (I) := Tmp (K + 1 - I);
      end loop;
      Len := K;
      while Seq (Len) < N loop
         Total := 0;
         for I in Len - K + 1 .. Len loop
            Total := Total + Seq (I);
         end loop;
         Len := Len + 1;
         Seq (Len) := Total;
      end loop;
      return Seq (Len) = N;
   end Is_Keith;
begin
   for N in 10 .. 1199 loop
      if Is_Keith (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Keith_Numbers;
