with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Pascal_Triangle is
   N : constant := 6;
   type Row is array (0 .. N) of Natural;
   Prev, Curr : Row := (others => 0);
begin
   Prev (0) := 1;
   for I in 0 .. N - 1 loop
      for J in 0 .. I loop
         Put (Prev (J), Width => 3);
      end loop;
      New_Line;
      Curr (0) := 1;
      for J in 1 .. I + 1 loop
         Curr (J) := Prev (J - 1) + Prev (J);
      end loop;
      Prev := Curr;
   end loop;
end Pascal_Triangle;
