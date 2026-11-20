with Ada.Text_IO; use Ada.Text_IO;
--  Aliquot sum classification.
procedure Aliquot_Sum is
   function Aliquot (N : Positive) return Natural is
      S : Natural := 0;
   begin
      for D in 1 .. N - 1 loop
         if N mod D = 0 then S := S + D; end if;
      end loop;
      return S;
   end Aliquot;
begin
   for N in Positive'(6) | 12 | 15 | 28 loop
      declare
         A : constant Natural := Aliquot (N);
         Kind : constant String := (if A = N then "perfect" elsif A > N then "abundant" else "deficient");
      begin
         Put_Line (Integer'Image (N) & Integer'Image (A) & " " & Kind);
      end;
   end loop;
end Aliquot_Sum;
