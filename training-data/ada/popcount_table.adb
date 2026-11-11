-- Population count (number of set bits) for 0..15
with Ada.Text_IO; use Ada.Text_IO;

procedure PopcountTable is
   function Pop (N : Natural) return Natural is
      X : Natural := N;
      C : Natural := 0;
   begin
      while X > 0 loop
         C := C + X mod 2;
         X := X / 2;
      end loop;
      return C;
   end Pop;
begin
   for N in 0 .. 15 loop
      Put (Natural'Image (Pop (N)));
   end loop;
   New_Line;
end PopcountTable;
