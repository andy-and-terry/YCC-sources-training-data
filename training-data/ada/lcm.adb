with Ada.Text_IO; use Ada.Text_IO;

procedure Lcm is
   function Gcd (A, B : Integer) return Integer is
      X : Integer := A;
      Y : Integer := B;
      T : Integer;
   begin
      while Y /= 0 loop
         T := Y;
         Y := X mod Y;
         X := T;
      end loop;
      return X;
   end Gcd;

   function Lcm_Val (A, B : Integer) return Integer is
   begin
      return A / Gcd (A, B) * B;
   end Lcm_Val;
begin
   Put_Line (Lcm_Val (4, 6)'Image);
   Put_Line (Lcm_Val (21, 6)'Image);
end Lcm;
