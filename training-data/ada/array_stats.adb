with Ada.Text_IO; use Ada.Text_IO;

procedure Array_Stats is
   type Int_Array is array (Positive range <>) of Integer;
   Data : constant Int_Array := (5, 3, 8, 1, 9, 2);
   Sum, Max_Val, Min_Val : Integer;
begin
   Sum := 0;
   Max_Val := Data (Data'First);
   Min_Val := Data (Data'First);
   for V of Data loop
      Sum := Sum + V;
      if V > Max_Val then Max_Val := V; end if;
      if V < Min_Val then Min_Val := V; end if;
   end loop;
   Put_Line ("Sum: " & Sum'Image);
   Put_Line ("Max: " & Max_Val'Image);
   Put_Line ("Min: " & Min_Val'Image);
end Array_Stats;
