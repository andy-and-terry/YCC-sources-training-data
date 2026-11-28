with Ada.Text_IO; use Ada.Text_IO;

procedure Happy_Numbers is
   function Digit_Square_Sum (N : Natural) return Natural is
      M : Natural := N;
      S : Natural := 0;
   begin
      while M > 0 loop
         S := S + (M mod 10) ** 2;
         M := M / 10;
      end loop;
      return S;
   end Digit_Square_Sum;

   function Is_Happy (N : Positive) return Boolean is
      Slow : Natural := N;
      Fast : Natural := N;
   begin
      loop
         Slow := Digit_Square_Sum (Slow);
         Fast := Digit_Square_Sum (Digit_Square_Sum (Fast));
         exit when Slow = Fast;
      end loop;
      return Slow = 1;
   end Is_Happy;

   Count : Natural := 0;
   N     : Positive := 1;
begin
   while Count < 8 loop
      if Is_Happy (N) then
         Put (Positive'Image (N));
         Count := Count + 1;
      end if;
      N := N + 1;
   end loop;
   New_Line;  --  1 7 10 13 19 23 28 31
end Happy_Numbers;
