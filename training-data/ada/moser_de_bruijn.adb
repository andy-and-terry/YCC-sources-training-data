with Ada.Text_IO; use Ada.Text_IO;
procedure Moser_De_Bruijn is
   --  Moser-de Bruijn sequence: binary digits of n read in base 4.
   function Moser (N_In : Natural) return Natural is
      N      : Natural := N_In;
      Place  : Natural := 1;
      Result : Natural := 0;
   begin
      while N > 0 loop
         if N mod 2 = 1 then
            Result := Result + Place;
         end if;
         N := N / 2;
         Place := Place * 4;
      end loop;
      return Result;
   end Moser;
begin
   for I in 0 .. 11 loop
      Put (Natural'Image (Moser (I)));
   end loop;
   New_Line;
end Moser_De_Bruijn;
