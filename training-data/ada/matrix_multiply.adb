with Ada.Text_IO; use Ada.Text_IO;

procedure Matrix_Multiply is
   type Matrix2x2 is array (1 .. 2, 1 .. 2) of Integer;

   function Multiply (A, B : Matrix2x2) return Matrix2x2 is
      Result : Matrix2x2 := (others => (others => 0));
   begin
      for I in 1 .. 2 loop
         for J in 1 .. 2 loop
            for K in 1 .. 2 loop
               Result (I, J) := Result (I, J) + A (I, K) * B (K, J);
            end loop;
         end loop;
      end loop;
      return Result;
   end Multiply;

   A : constant Matrix2x2 := ((1, 2), (3, 4));
   B : constant Matrix2x2 := ((5, 6), (7, 8));
   C : constant Matrix2x2 := Multiply (A, B);
begin
   for I in 1 .. 2 loop
      for J in 1 .. 2 loop
         Put (C (I, J)'Image);
      end loop;
      New_Line;
   end loop;
end Matrix_Multiply;
