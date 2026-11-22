with Ada.Text_IO; use Ada.Text_IO;
procedure Repunit_Numbers is
   --  Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
   R : Long_Long_Integer := 0;
begin
   for I in 1 .. 8 loop
      R := R * 10 + 1;
      Put (Long_Long_Integer'Image (R));
   end loop;
   New_Line;
end Repunit_Numbers;
