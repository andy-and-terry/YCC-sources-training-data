with Ada.Text_IO; use Ada.Text_IO;

procedure Cullen_Numbers is
   function Cullen (N : Natural) return Long_Long_Integer is
   begin
      return Long_Long_Integer (N) * 2 ** N + 1;
   end Cullen;
begin
   for N in 1 .. 5 loop
      Put_Line (Natural'Image (N) & Long_Long_Integer'Image (Cullen (N)));
   end loop;
end Cullen_Numbers;
