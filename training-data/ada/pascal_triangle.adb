with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Pascal_Triangle is
   Rows : constant := 6;
   type Row_Array is array (0 .. Rows - 1) of Natural;
   Row : Row_Array := (others => 0);
begin
   Row (0) := 1;
   for I in 0 .. Rows - 1 loop
      for J in reverse 1 .. I loop
         Row (J) := Row (J) + Row (J - 1);
      end loop;
      for J in 0 .. I loop
         Put (Row (J), Width => 3);
      end loop;
      New_Line;
   end loop;
end Pascal_Triangle;
