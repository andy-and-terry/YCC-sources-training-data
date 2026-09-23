with Ada.Text_IO; use Ada.Text_IO;

procedure Matrix_Chain_Multiplication is
   -- Dims (I-1) x Dims (I) is the shape of matrix I, for I in 1 .. N.
   Dims : constant array (0 .. 5) of Integer := (30, 35, 15, 5, 10, 20);
   N    : constant Integer := Dims'Last; -- number of matrices

   Infinity : constant := 1_000_000_000;

   type Cost_Matrix is array (1 .. N, 1 .. N) of Integer;
   Cost : Cost_Matrix := (others => (others => 0));

   I, J, Cost_Try : Integer;
begin
   -- Cost (I, J) is the minimum number of scalar multiplications
   -- needed to compute the product of matrices I through J.
   for Len in 2 .. N loop
      for L in 1 .. N - Len + 1 loop
         I := L;
         J := L + Len - 1;
         Cost (I, J) := Infinity;
         for K in I .. J - 1 loop
            Cost_Try := Cost (I, K) + Cost (K + 1, J)
              + Dims (I - 1) * Dims (K) * Dims (J);
            if Cost_Try < Cost (I, J) then
               Cost (I, J) := Cost_Try;
            end if;
         end loop;
      end loop;
   end loop;

   Put_Line ("Minimum multiplication cost:" & Cost (1, N)'Image);
end Matrix_Chain_Multiplication;
