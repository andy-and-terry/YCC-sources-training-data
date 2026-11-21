with Ada.Text_IO; use Ada.Text_IO;
procedure Perfect_Totient_Numbers is
   --  Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
   function GCD (A, B : Natural) return Natural is
   begin
      if B = 0 then return A; else return GCD (B, A mod B); end if;
   end GCD;

   function Phi (N : Positive) return Natural is
      C : Natural := 0;
   begin
      for K in 1 .. N loop
         if GCD (K, N) = 1 then C := C + 1; end if;
      end loop;
      return C;
   end Phi;

   function Chain_Sum (N : Positive) return Natural is
      Total : Natural := 0;
      M : Natural := N;
   begin
      while M > 1 loop
         M := Phi (M);
         Total := Total + M;
      end loop;
      return Total;
   end Chain_Sum;
begin
   for N in 2 .. 199 loop
      if Chain_Sum (N) = N then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Perfect_Totient_Numbers;
