with Ada.Text_IO; use Ada.Text_IO;

procedure Equilibrium_Index is
   Nums  : constant array (0 .. 5) of Integer := (1, 7, 3, 6, 5, 6);
   Total : Integer := 0;
   Left  : Integer := 0;
   Found : Integer := -1;
begin
   for V of Nums loop
      Total := Total + V;
   end loop;
   for I in Nums'Range loop
      if Found < 0 and then Left = Total - Left - Nums (I) then
         Found := I;
      end if;
      Left := Left + Nums (I);
   end loop;
   Put_Line (Integer'Image (Found)); -- 3
end Equilibrium_Index;
