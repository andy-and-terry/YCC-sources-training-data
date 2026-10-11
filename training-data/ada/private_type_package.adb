with Ada.Text_IO; use Ada.Text_IO;

procedure Private_Type_Package is
   package Money is
      type Amount is private;
      function Make (Cents : Integer) return Amount;
      function "+" (L, R : Amount) return Amount;
      function Image (A : Amount) return String;
   private
      type Amount is record
         Cents : Integer := 0;
      end record;
   end Money;

   package body Money is
      function Make (Cents : Integer) return Amount is (Cents => Cents);
      function "+" (L, R : Amount) return Amount is (Cents => L.Cents + R.Cents);
      function Image (A : Amount) return String is
         Dollars : constant Integer := A.Cents / 100;
         Rest    : constant Integer := A.Cents mod 100;
         Pad     : constant String := (if Rest < 10 then "0" else "");
      begin
         return "$" & Integer'Image (Dollars) & "." & Pad & Integer'Image (Rest);
      end Image;
   end Money;

   Total : Money.Amount := Money.Make (1050);
begin
   Total := Money.Make (1050) + Money.Make (295);
   Put_Line (Money.Image (Total));
end Private_Type_Package;
