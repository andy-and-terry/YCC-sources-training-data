with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci is
   function Fib (N : Natural) return Natural is
      A, B, Temp : Natural := 0;
   begin
      A := 0;
      B := 1;
      for I in 1 .. N loop
         Temp := A + B;
         A := B;
         B := Temp;
      end loop;
      return A;
   end Fib;
begin
   for I in 0 .. 10 loop
      Put (Fib (I)'Image);
   end loop;
   New_Line;
end Fibonacci;
