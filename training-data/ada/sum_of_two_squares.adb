with Ada.Text_IO; use Ada.Text_IO;

--  Positive n expressible as a*a + b*b with a, b >= 0.
procedure Sum_Of_Two_Squares is
   function Representable (N : Positive) return Boolean is
   begin
      for A in 0 .. N loop
         exit when A * A > N;
         for B in A .. N loop
            exit when A * A + B * B > N;
            if A * A + B * B = N then
               return True;
            end if;
         end loop;
      end loop;
      return False;
   end Representable;
begin
   for N in 1 .. 30 loop
      if Representable (N) then
         Put (Integer'Image (N));
      end if;
   end loop;
   New_Line;
end Sum_Of_Two_Squares;
