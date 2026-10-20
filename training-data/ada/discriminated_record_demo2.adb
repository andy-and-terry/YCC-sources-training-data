with Ada.Text_IO; use Ada.Text_IO;
procedure Discriminated_Record_Demo2 is
   type Kind is (Circle, Square);
   type Shape (K : Kind := Circle) is record
      case K is
         when Circle => Radius : Float;
         when Square => Side   : Float;
      end case;
   end record;
   S : Shape := (K => Square, Side => 3.0);
begin
   Put_Line (Kind'Image (S.K) & Float'Image (S.Side));
end Discriminated_Record_Demo2;
