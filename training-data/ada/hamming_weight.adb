with Ada.Text_IO; use Ada.Text_IO;
with Interfaces;  use Interfaces;

procedure Hamming_Weight is
   N : Unsigned_32 := 16#B7#;
   Count : Natural := 0;
begin
   while N /= 0 loop
      N := N and (N - 1);
      Count := Count + 1;
   end loop;
   Put_Line (Natural'Image (Count));
end Hamming_Weight;
