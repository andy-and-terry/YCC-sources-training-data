with Ada.Text_IO; use Ada.Text_IO;

procedure Catalan_Numbers is
   N : constant := 10;
   type Cat_Array is array (0 .. N) of Long_Long_Integer;
   C : Cat_Array := (others => 0);
begin
   C (0) := 1;
   for I in 1 .. N loop
      C (I) := 0;
      for J in 0 .. I - 1 loop
         C (I) := C (I) + C (J) * C (I - 1 - J);
      end loop;
   end loop;

   for I in 0 .. N loop
      Put (C (I)'Image);
   end loop;
   New_Line;
end Catalan_Numbers;
