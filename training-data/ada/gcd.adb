with Ada.Text_IO; use Ada.Text_IO;

procedure Gcd is
   function Compute_Gcd (A, B : Natural) return Natural is
      X : Natural := A;
      Y : Natural := B;
      Temp : Natural;
   begin
      while Y /= 0 loop
         Temp := Y;
         Y := X mod Y;
         X := Temp;
      end loop;
      return X;
   end Compute_Gcd;
begin
   Put_Line (Compute_Gcd (48, 18)'Image);
   Put_Line (Compute_Gcd (100, 75)'Image);
end Gcd;
