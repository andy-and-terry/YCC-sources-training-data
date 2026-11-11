--  Repunits: numbers made only of the digit 1.
with Ada.Text_IO; use Ada.Text_IO;

procedure Repunit_Numbers is
   R : Long_Long_Integer := 0;
begin
   for I in 1 .. 5 loop
      R := R * 10 + 1;
      Put (Long_Long_Integer'Image (R) & " ");
   end loop;
   New_Line;
end Repunit_Numbers;
