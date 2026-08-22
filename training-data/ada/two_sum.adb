with Ada.Text_IO; use Ada.Text_IO;

procedure Two_Sum is
   type Int_Array is array (Positive range <>) of Integer;
   Nums : constant Int_Array := (2, 7, 11, 15);
   Target : constant Integer := 9;
begin
   for I in Nums'First .. Nums'Last loop
      for J in I + 1 .. Nums'Last loop
         if Nums (I) + Nums (J) = Target then
            Put_Line (I'Image & " " & J'Image);
         end if;
      end loop;
   end loop;
end Two_Sum;
