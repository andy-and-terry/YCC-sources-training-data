with Ada.Text_IO; use Ada.Text_IO;

procedure Pascals_Triangle is
   Rows : constant := 6;
   type Row_Array is array (0 .. Rows - 1) of Natural;
   type Triangle_Array is array (0 .. Rows - 1) of Row_Array;
   Triangle : Triangle_Array := (others => (others => 0));
begin
   for R in 0 .. Rows - 1 loop
      Triangle (R) (0) := 1;
      Triangle (R) (R) := 1;
      for C in 1 .. R - 1 loop
         Triangle (R) (C) := Triangle (R - 1) (C - 1) + Triangle (R - 1) (C);
      end loop;
   end loop;

   for R in 0 .. Rows - 1 loop
      for C in 0 .. R loop
         Put (Triangle (R) (C)'Image);
      end loop;
      New_Line;
   end loop;
end Pascals_Triangle;
