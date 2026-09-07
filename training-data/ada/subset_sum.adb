with Ada.Text_IO; use Ada.Text_IO;

procedure Subset_Sum is
   type Int_Array is array (Positive range <>) of Integer;
   Numbers : constant Int_Array := (3, 34, 4, 12, 5, 2);
   Target : constant Integer := 9;
   type Bool_Table is array (0 .. Numbers'Length, 0 .. Target) of Boolean;
   DP : Bool_Table := (others => (others => False));
begin
   for I in 0 .. Numbers'Length loop
      DP (I, 0) := True;
   end loop;
   for I in 1 .. Numbers'Length loop
      for S in 0 .. Target loop
         if Numbers (I) <= S then
            DP (I, S) := DP (I - 1, S) or DP (I - 1, S - Numbers (I));
         else
            DP (I, S) := DP (I - 1, S);
         end if;
      end loop;
   end loop;
   Put_Line (DP (Numbers'Length, Target)'Image);
end Subset_Sum;
