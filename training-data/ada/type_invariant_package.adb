with Ada.Text_IO; use Ada.Text_IO;

procedure Type_Invariant_Package is
   package Ranges is
      type Interval is private;
      function Make (Lo, Hi : Integer) return Interval;
      function Width (I : Interval) return Natural;
   private
      type Interval is record
         Lo, Hi : Integer := 0;
      end record
        with Type_Invariant => Interval.Lo <= Interval.Hi;
   end Ranges;

   package body Ranges is
      function Make (Lo, Hi : Integer) return Interval is ((Lo, Hi));
      function Width (I : Interval) return Natural is (I.Hi - I.Lo);
   end Ranges;
begin
   Put_Line (Ranges.Width (Ranges.Make (3, 10))'Image);
end Type_Invariant_Package;
