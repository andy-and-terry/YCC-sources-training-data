--  Amicable pairs: D(A) = B and D(B) = A with A /= B.
with Ada.Text_IO; use Ada.Text_IO;

procedure Amicable_Pairs is
   function D (N : Positive) return Natural is
      S : Natural := 0;
   begin
      for I in 1 .. N - 1 loop
         if N mod I = 0 then
            S := S + I;
         end if;
      end loop;
      return S;
   end D;
begin
   for A in 2 .. 1499 loop
      declare
         B : constant Natural := D (A);
      begin
         if B > A and then D (B) = A then
            Put_Line (Integer'Image (A) & Integer'Image (B));
         end if;
      end;
   end loop;
end Amicable_Pairs;
