with Ada.Text_IO; use Ada.Text_IO;

procedure Prime_Factorization is
   procedure Factorize (N : Positive) is
      Value  : Positive := N;
      Factor : Positive := 2;
   begin
      Put (N'Image & " = ");
      while Factor * Factor <= Value loop
         while Value mod Factor = 0 loop
            Put (Factor'Image);
            Value := Value / Factor;
            if Value /= 1 then
               Put (" x");
            end if;
         end loop;
         Factor := Factor + 1;
      end loop;
      if Value > 1 then
         Put (Value'Image);
      end if;
      New_Line;
   end Factorize;
begin
   Factorize (360);
   Factorize (97);
   Factorize (1_001);
end Prime_Factorization;
