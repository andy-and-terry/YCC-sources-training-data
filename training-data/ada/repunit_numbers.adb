with Ada.Text_IO; use Ada.Text_IO;
procedure Repunit_Numbers is
   --  Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
   R : Long_Long_Integer := 0;
begin
   for N in 1 .. 8 loop
      R := R * 10 + 1;
      Put (Long_Long_Integer'Image (R));
      if R mod 3 = 0 then
         Put ("  (divisible by 3)");
      end if;
      New_Line;
   end loop;
end Repunit_Numbers;
