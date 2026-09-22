with Ada.Text_IO; use Ada.Text_IO;

procedure Radix_Sort is
   type Int_Array is array (Positive range <>) of Natural;

   procedure Sort (Data : in out Int_Array) is
      Max_Val : Natural := 0;
      Exp     : Natural := 1;
   begin
      for V of Data loop
         if V > Max_Val then
            Max_Val := V;
         end if;
      end loop;

      while Max_Val / Exp > 0 loop
         declare
            Buckets : array (0 .. 9) of Natural := (others => 0);
            Output  : Int_Array (Data'Range);
            Digit   : Natural;
         begin
            for V of Data loop
               Digit := (V / Exp) mod 10;
               Buckets (Digit) := Buckets (Digit) + 1;
            end loop;
            for D in 1 .. 9 loop
               Buckets (D) := Buckets (D) + Buckets (D - 1);
            end loop;
            for I in reverse Data'Range loop
               Digit := (Data (I) / Exp) mod 10;
               Output (Output'First + Buckets (Digit) - 1) := Data (I);
               Buckets (Digit) := Buckets (Digit) - 1;
            end loop;
            Data := Output;
         end;
         Exp := Exp * 10;
      end loop;
   end Sort;

   Values : Int_Array := (170, 45, 75, 90, 802, 24, 2, 66);
begin
   Sort (Values);
   for V of Values loop
      Put (V'Image);
   end loop;
   New_Line;
end Radix_Sort;
