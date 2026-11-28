with Ada.Text_IO; use Ada.Text_IO;

procedure Gould_Sequence is
   function Popcount (N : Natural) return Natural is
      M : Natural := N;
      C : Natural := 0;
   begin
      while M > 0 loop
         C := C + M mod 2;
         M := M / 2;
      end loop;
      return C;
   end Popcount;
begin
   for N in 0 .. 15 loop
      Put (Natural'Image (2 ** Popcount (N)));
   end loop;
   New_Line;
end Gould_Sequence;
