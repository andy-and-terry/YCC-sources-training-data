with Ada.Text_IO; use Ada.Text_IO;

procedure Moser_De_Bruijn is
   --  Read the binary digits of I as base-4 digits.
   function Moser (I : Natural) return Natural is
      X     : Natural := I;
      Value : Natural := 0;
      Power : Natural := 1;
   begin
      while X > 0 loop
         if X mod 2 = 1 then Value := Value + Power; end if;
         Power := Power * 4;
         X := X / 2;
      end loop;
      return Value;
   end Moser;
begin
   for I in 0 .. 9 loop
      Put (Natural'Image (Moser (I)));
   end loop;
   New_Line;  --  0 1 4 5 16 17 20 21 64 65
end Moser_De_Bruijn;
