with Ada.Text_IO; use Ada.Text_IO;

procedure Gcd_Of_Array is
   type Int_Array is array (Positive range <>) of Integer;

   function Gcd (A, B : Integer) return Integer is
      X : Integer := abs A;
      Y : Integer := abs B;
      T : Integer;
   begin
      while Y /= 0 loop
         T := X mod Y;
         X := Y;
         Y := T;
      end loop;
      return X;
   end Gcd;

   function Gcd_All (V : Int_Array) return Integer is
      G : Integer := 0;
   begin
      for N of V loop
         G := Gcd (G, N);
      end loop;
      return G;
   end Gcd_All;
begin
   Put_Line (Integer'Image (Gcd_All ((12, 18, 24))));
   Put_Line (Integer'Image (Gcd_All ((7, 13))));
end Gcd_Of_Array;
